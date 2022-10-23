import * as nodemailer from 'nodemailer';
import * as crypto from 'crypto';
import * as argon2 from 'argon2';
import SnowflakeID from './Snowflake.js';
import db from './../connection.js';
class UserManagement {
    static SHOULD_SEND_EMAIL = false;
    static mail = nodemailer.createTransport({
        //TODO: change to service with no limits
        host: 'smtp.office365.com',
        port: 587,
        secure: false,
        auth: {
            user: 'gamiifrytak@outlook.com',
            pass: 'haslo123',
        },
        //supportBigNumbers: true,
        //bigNumberStrings: true,
    });
    static async insertVerificationCode(ID, email) {
        return new Promise(async (resolve, reject) => {
            const verifyID = SnowflakeID.createID('001');
            //generate 200 character long verification code
            const verifyCode = crypto.randomBytes(100).toString('base64url');
            let query = 'INSERT INTO verifyaccount (id, userId, hash, isUsed) VALUES (?,?,?,false);';
            const [results, fields] = await db.execute(query, [
                verifyID,
                ID,
                verifyCode,
            ]);
            if (results.affectedRows == 1) {
                UserManagement.sendEmail(email, 'Verify your account', 'http://localhost:1234/ValidateAccount/' + verifyCode);
            }
            resolve(true);
        });
    }
    static async insertUserData(ID, firstName, lastName, dateOfBirth, gminaId, powiatId, wojewodztwoId, email, hashedPassword, salt) {
        let query = "INSERT INTO users (id, firstName,lastName,dateOfBirth,gminaId, powiatId, wojewodztwoId, email, password, salt, isactivated,tokens) VALUES (?,?,?,?,?,?,?,?,?,?,false,'[]');";
        let [results, fields] = await db.execute(query, [
            ID,
            firstName,
            lastName,
            dateOfBirth,
            gminaId,
            powiatId,
            wojewodztwoId,
            email,
            hashedPassword,
            salt,
        ]);
        if (results.affectedRows != 1) {
            return false;
        }
        return true;
    }
    static sendEmail(recipient, subject, text) {
        var mailOptions = {
            from: 'gamiifrytak@outlook.com',
            to: recipient,
            subject: subject,
            text: text,
        };
        if (this.SHOULD_SEND_EMAIL) {
            this.mail.sendMail(mailOptions, function (error) {
                if (error) {
                    console.log(error);
                }
                else {
                    console.log('Email sent :)');
                }
            });
        }
        else {
            console.log('Email sending not enabled', mailOptions);
        }
    }
    static async hashPassword(password) {
        let salt = crypto.randomBytes(32).toString('base64');
        let hashedPassword = salt + password + '4m06u52u5'; //pepper
        //hash password
        hashedPassword = await argon2.hash(hashedPassword);
        return { hashedPassword: hashedPassword, salt: salt };
    }
    static async checkPassword(password, salt, hashedPassword) {
        password = salt + password + '4m06u52u5'; //pepper
        return await argon2.verify(hashedPassword, password);
    }
    static async setVerificationCodeToUsed(hash) {
        const query = 'UPDATE verifyaccount SET isUsed = true WHERE hash = ?';
        const [results, fields] = await db.execute(query, [hash]);
        if (results.affectedRows == 0) {
            return false;
        }
        return true;
    }
    static async getDataFromVerificationCode(hash) {
        let query = 'SELECT userId, id, isUsed FROM verifyaccount WHERE hash = ?';
        let [results, fields] = await db.execute(query, [hash]);
        console.log('results', results);
        if (results.length > 0) {
            return {
                hashId: results[0].id,
                userId: results[0].userId,
                isUsed: results[0].isUsed,
                isOkay: true,
            };
        }
        else {
            return { isOkay: false };
        }
    }
    static async getAuthData(email) {
        let query = 'SELECT id, password, salt, isActivated, tokens, firstName, lastName, email, ranks FROM users WHERE email = ?';
        let [results, fields] = await db.execute(query, [email]);
        if (results.length > 0) {
            let userId = results[0].id;
            let isActivated = results[0].isActivated;
            let tokens = JSON.parse(results[0].tokens);
            let hashedPassword = results[0].password;
            let salt = results[0].salt;
            let firstName = results[0].firstName;
            let lastName = results[0].lastName;
            let email = results[0].email;
            let ranks = JSON.parse(results[0].ranks);
            return {
                userId: userId,
                isActivated: isActivated,
                tokens: tokens,
                hashedPassword: hashedPassword,
                salt: salt,
                firstName: firstName,
                lastName: lastName,
                email: email,
                ranks: ranks,
                isOkay: true,
            };
        }
        else {
            return {
                isOkay: false,
                userId: '',
                isActivated: false,
                tokens: [],
                hashedPassword: '',
                salt: '',
                firstName: '',
                lastName: '',
                email: '',
                ranks: [],
            };
        }
    }
    static async activateAccount(userId) {
        let query = 'UPDATE users SET isActivated = 1 WHERE id = ?';
        let [results, fields] = await db.execute(query, [userId]);
        if (results.affectedRows == 1) {
            return true;
        }
        return false;
    }
    static async checkiIfaccountIsActivated(userId) {
        let query = 'SELECT isActivated FROM users WHERE id = ?';
        let [results, fields] = await db.execute(query, [userId]);
        if (results.length == 0) {
            console.log('User does not exist');
            return false;
        }
        let isActivated = results[0].isActivated;
        if (isActivated) {
            return true;
        }
        return false;
    }
    static async resendEmailIftokenTooOld(hashId, userId) {
        let age = SnowflakeID.getDataFromID(hashId).age;
        let email;
        if (age > 3) {
            let query = 'SELECT email, isActivated FROM users WHERE id = ?';
            let [results, fields] = await db.execute(query, [
                userId,
            ]);
            //sends email with new code
            if (results.length > 0) {
                email = results[0].email;
            }
            else {
                return {
                    isOkay: false,
                    message: 'Something went wrong, please try again later',
                };
            }
            UserManagement.insertVerificationCode(userId, email);
            return {
                isOkay: false,
                message: 'New verification link has been sent to your e-mail',
            };
        }
        return { isOkay: true };
    }
    static async updateToken(userId, tokens) {
        let token = crypto.randomBytes(100).toString('base64url');
        tokens.push(token);
        let query = 'UPDATE users SET tokens = ? WHERE id = ?';
        let result = await db.execute(query, [
            JSON.stringify(tokens),
            userId,
        ]);
        if (result[0].affectedRows == 1) {
            return { token: token, isOkay: true };
        }
        return { token: '', isOkay: false };
    }
    static async isLoggedIn(email, token, id) {
        let query = 'SELECT tokens FROM users WHERE email = ? AND id = ?';
        let [results, fields] = await db.execute(query, [
            email,
            id,
        ]);
        if (results.length > 0) {
            let tokens = JSON.parse(results[0].tokens);
            let index = tokens.indexOf(token);
            if (index > -1) {
                return true;
            }
        }
        return false;
    }
    static async logout(email, token, id) {
        let query = 'SELECT id, tokens FROM users WHERE email = ?';
        let [results, fields] = await db.execute(query, [email]);
        if (results.length > 0) {
            let userId = results[0].id;
            let tokens = JSON.parse(results[0].tokens);
            if (userId == id) {
                let index = tokens.indexOf(token);
                if (index > -1) {
                    tokens.splice(index, 1);
                    query = 'UPDATE users SET tokens = ? WHERE id = ?';
                    db.execute(query, [JSON.stringify(tokens), userId]);
                    return true;
                }
            }
        }
        return false;
    }
    static async getDataFromToken(token, id) {
        let query = 'SELECT id,firstName,lastName,email,tokens,ranks FROM users WHERE id = ?';
        let [results, fields] = await db.execute(query, [id]);
        if (results.length > 0) {
            let tokens = JSON.parse(results[0].tokens);
            let index = tokens.indexOf(token);
            if (index > -1 && results[0].id == id) {
                return {
                    isOkay: true,
                    firstName: results[0].firstName,
                    lastName: results[0].lastName,
                    email: results[0].email,
                    ranks: JSON.parse(results[0].ranks),
                };
            }
        }
        return { isOkay: false };
    }
}
export default UserManagement;
