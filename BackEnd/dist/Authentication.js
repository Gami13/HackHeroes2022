import DataValidation from './classes/DataValidation.js';
import SnowflakeID from './classes/Snowflake.js';
import UserManagement from './classes/UserManagement.js';
import * as crypto from 'crypto';
import db from './connection.js';
export default function authentication(app) {
    app.post('/registerUser', async (req, res) => {
        let firstName = req.body.firstName;
        let lastName = req.body.lastName;
        let dateOfBirth = new Date(req.body.dateOfBirth);
        let gminaId = req.body.town.id;
        let powiatId = req.body.county.id;
        let wojewodztwoId = req.body.voivodeship.id;
        let email = req.body.email;
        let password = req.body.password;
        let passwordConfirm = req.body.passwordConfirm;
        console.log(req.body);
        console.log('test', new Date(dateOfBirth));
        //TODO add validation for first name and last name
        if (!DataValidation.isUserDataValid(firstName, email, password, passwordConfirm, dateOfBirth)) {
            res.sendError('Invalid form data');
            return false;
        }
        let { hashedPassword, salt } = await UserManagement.hashPassword(password);
        let ID = SnowflakeID.createID('000');
        //check if gmina exists
        let [gminaResults, gminaFields] = await db.execute('SELECT id FROM gminy WHERE id = ? LIMIT 1', [gminaId]);
        if (gminaResults.length == 0) {
            res.sendError('Invalid gmina');
            return false;
        }
        /* 	console.log(
            `Username: ${username} | E-Mail: ${email} | Password: | ${password} | PasswordCofirm: ${passwordConfirm} | HashedPassword: ${hashedPassword} | Salt: ${salt} | ID: ${ID} }`
        ); */
        let availability = await DataValidation.isUserAvailable(email, db);
        if (!availability) {
            res.sendError('Username or E-Mail already in use');
            return false;
        }
        UserManagement.insertVerificationCode(ID, email);
        if (!(await UserManagement.insertUserData(ID, firstName, lastName, dateOfBirth, gminaId, powiatId, wojewodztwoId, email, hashedPassword, salt))) {
            res.sendError('Failed to register user');
            return false;
        }
        res.sendSuccess('User registered successfully');
        return true;
    });
    app.get('/verify/:id', async (req, res) => {
        const hash = req.params.id;
        console.log(hash);
        let { hashId, userId, isUsed, isOkay } = await UserManagement.getDataFromVerificationCode(hash);
        if (!isOkay) {
            res.sendError('Unable to find account correlating to your verification link');
            return false;
        }
        if (isUsed == true) {
            res.sendError('The verification link has been used already');
            return false;
        }
        let result = await UserManagement.resendEmailIftokenTooOld(hashId, userId);
        if (!result.isOkay) {
            res.sendError(result.message);
        }
        let isActivated = await UserManagement.checkiIfaccountIsActivated(userId);
        if (isActivated) {
            res.sendError('Your account has already been activated');
            return false;
        }
        const wasCodeUsed = await UserManagement.setVerificationCodeToUsed(hash);
        console.log(wasCodeUsed);
        if (!wasCodeUsed) {
            res.sendError('Something went wrong, please try again later', 500);
            return false;
        }
        if (await UserManagement.activateAccount(userId)) {
            res.sendSuccess('Verified Correctly');
            return true;
        }
        res.sendError('Something went wrong', 500);
        return false;
    });
    app.post('/sendPasswordReset', async (req, res) => {
        console.log(req.body);
        let email = req.body.email;
        let passResetID = SnowflakeID.createID('100');
        let query = 'SELECT id FROM users WHERE email = ?';
        let [results, fields] = await db.execute(query, [email]);
        if (results.length > 0) {
            let userId = results[0].id;
            //create 200 character long hash
            let resetHash = crypto.randomBytes(100).toString('base64url');
            UserManagement.sendEmail(email, 'Reset Hasla', 'Resetuj swoje hasło na http://localhost/resetPassword/' + resetHash);
            query =
                'INSERT INTO passwordReset (id, userId,hash, isUsed) VALUES (?,?,?,false)';
            await db.execute(query, [passResetID, userId, resetHash]);
            res.sendSuccess('Email with password reset code sent');
        }
        else {
            res.send({ status: 'error', message: 'Email not found' });
        }
    });
    app.post('/resetPassword', async (req, res) => {
        console.log(req.body);
        let token = req.body.token;
        let password = req.body.password;
        let passwordConfirm = req.body.passwordConfirm;
        let isPasswordOkay = DataValidation.validatePassword(password, passwordConfirm).length == 0;
        if (!isPasswordOkay) {
            res.send({
                status: 'error',
                message: 'Password is not valid, please try again',
            });
            return false;
        }
        //TODO: Put into separate function
        let query = 'SELECT userId, isUsed FROM passwordReset WHERE hash = ?';
        let [results, fields] = await db.execute(query, [token]);
        if (results.length > 0) {
            let userId = results[0].userId;
            let isUsed = results[0].isUsed;
            if (isUsed == true) {
                res.sendError('The password reset link has been used already');
                return false;
            }
            let { hashedPassword, salt } = await UserManagement.hashPassword(password);
            query = 'UPDATE users SET password = ?, salt = ? WHERE id = ?';
            db.execute(query, [hashedPassword, salt, userId]);
            query = 'UPDATE passwordReset SET isUsed = true WHERE hash = ?';
            db.execute(query, [token]);
            res.sendSuccess('Password reset correctly');
            return true;
        }
    });
    //#region login and everything related to it
    app.post('/login', async (req, res) => {
        //SEND ACCOUNT DATA TO CLIENT
        let email = req.body.email;
        let password = req.body.password;
        let { userId, isActivated, tokens, hashedPassword, salt, isOkay } = await UserManagement.getAuthData(email);
        if (!isOkay) {
            res.sendError('Nie znaleziono użytkownika');
            return false;
        }
        if (isActivated == false) {
            res.sendError('Twoje konto nie zostało aktywowane');
            return false;
        }
        let isPasswordCorrect = await UserManagement.checkPassword(password, salt, hashedPassword);
        if (isPasswordCorrect) {
            let { token, isOkay } = await UserManagement.updateToken(userId, tokens);
            if (!isOkay) {
                res.sendError('Coś poszło nie tak, spróbuj ponownie później');
                return false;
            }
            const r = await UserManagement.getDataFromToken(token, userId);
            if (!r.isOkay) {
                res.sendError('Coś poszło nie tak, spróbuj ponownie później');
                return false;
            }
            /* check is admin */
            /* TODO: fetch first name and last name and id */
            res.sendSuccess('Zalogowano pomyślnie', {
                token: token,
                ranks: r.ranks,
                email: email,
                firstName: r.firstName,
                lastName: r.lastName,
                id: userId,
            });
            return true;
        }
        else {
            res.sendError('Incorrect password');
            return false;
        }
    });
    app.post('/isLoggedIn', async (req, res) => {
        let id = req.body.id || '';
        let email = req.body.email || '';
        let token = req.body.token || '';
        if (await UserManagement.isLoggedIn(email, token, id)) {
            res.sendSuccess('Logged in');
        }
        else {
            res.sendError('Something went wrong', 401);
        }
        return false;
    });
    app.post('/logout', async (req, res) => {
        let id = req.body.id;
        let email = req.body.email;
        let token = req.body.token;
        if (await UserManagement.logout(email, token, id)) {
            res.sendSuccess('Logged out correctly');
            return true;
        }
        res.sendError('Something went wrong');
        return false;
    });
    app.post('/UserData', async (req, res) => {
        let id = req.body.id;
        let email = req.body.email;
        let token = req.body.token;
        if (await UserManagement.isLoggedIn(email, token, id)) {
            const { firstName, lastName, email, ranks, isOkay } = await UserManagement.getDataFromToken(token, id);
            if (!isOkay) {
                res.sendError('Something went wrong');
                return false;
            }
            res.sendSuccess({ firstName, lastName, email, ranks });
        }
        else {
            res.sendError('Something went wrong', 401);
        }
    });
    //#endregion
    console.green('Authentication Routes Loaded ✔');
}
