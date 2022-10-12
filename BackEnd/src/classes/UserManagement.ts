import * as nodemailer from 'nodemailer';
import * as crypto from 'crypto';
import * as argon2 from 'argon2';
import SnowflakeID from './Snowflake.js';
import db from './../connection.js';
import type { OkPacket, RowDataPacket } from 'mysql2';

import type { Options } from 'nodemailer/lib/mailer';

type tokens = string[];

class UserManagement {
	static SHOULD_SEND_EMAIL = false;

	static mail = nodemailer.createTransport<Options>({
		//TODO: change to service with no limits
		//@ts-ignore
		host: 'smtp.office365.com',
		port: 587,
		secure: false,
		auth: {
			user: 'gamiifrytak@outlook.com',
			pass: 'haslo123',
		},
		supportBigNumbers: true,
		bigNumberStrings: true,
	});
	static async insertVerificationCode(ID: string, email: string) {
		return new Promise(async (resolve, reject) => {
			const verifyID = SnowflakeID.createID('001');
			//generate 200 character long verification code
			const verifyCode = crypto.randomBytes(100).toString('base64url');

			let query =
				'INSERT INTO verifyaccount (id, userId, hash, isUsed) VALUES (?,?,?,false);';

			const [results, fields] = await db.execute<OkPacket>(query, [
				verifyID,
				ID,
				verifyCode,
			]);

			if (results.affectedRows == 1) {
				UserManagement.sendEmail(
					email,
					'Verify your account',
					'http://localhost:1234/ValidateAccount/' + verifyCode
				);
			}

			resolve(true);
		});
	}
	static async insertUserData(
		ID: string,
		firstName: string,
		lastName: string,
		email: string,
		hashedPassword: string,
		salt: string
	) {
		let query =
			'INSERT INTO users (id, firstName,lastName, email, password, salt, isactivated) VALUES (?,?,?,?,?,?,false);';

		let [results, fields] = await db.execute<OkPacket>(query, [
			ID,
			firstName,
			lastName,
			email,
			hashedPassword,
			salt,
		]);

		if (results.affectedRows != 1) {
			return false;
		}
		return true;
	}
	static sendEmail(recipient: string, subject: string, text: string) {
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
				} else {
					console.log('Email sent :)');
				}
			});
		} else {
			console.log('Email sending not enabled', mailOptions);
		}
	}
	static async hashPassword(password: string) {
		let salt = crypto.randomBytes(32).toString('base64');

		let hashedPassword = salt + password + '4m06u52u5'; //pepper
		//hash password
		hashedPassword = await argon2.hash(hashedPassword);
		return { hashedPassword: hashedPassword, salt: salt };
	}
	static async checkPassword(
		password: string,
		salt: string,
		hashedPassword: string
	) {
		password = salt + password + '4m06u52u5'; //pepper
		return await argon2.verify(hashedPassword, password);
	}
	static async setVerificationCodeToUsed(hash: string) {
		const query = 'UPDATE verifyaccount SET isUsed = true WHERE hash = ?';

		const [results, fields] = await db.execute<OkPacket>(query, [hash]);

		if (results.affectedRows == 0) {
			return false;
		}
		return true;
	}
	static async getDataFromVerificationCode(hash: string) {
		let query = 'SELECT userId, id, isUsed FROM verifyaccount WHERE hash = ?';
		let [results, fields] = await db.execute<RowDataPacket[]>(query, [hash]);
		console.log('results', results);
		if (results.length > 0) {
			return {
				hashId: results[0].id,
				userId: results[0].userId,
				isUsed: results[0].isUsed,
				isOkay: true,
			};
		} else {
			return { isOkay: false };
		}
	}

	static async getAuthData(email: string) {
		let query =
			'SELECT id, password, salt, isActivated, tokens, firstName, lastName, email, ranks FROM users WHERE email = ?';
		let [results, fields] = await db.execute<RowDataPacket[]>(query, [email]);
		if (results.length > 0) {
			let userId: string = results[0].id;
			let isActivated: boolean = results[0].isActivated;
			let tokens: tokens = JSON.parse(results[0].tokens);
			let hashedPassword: string = results[0].password;
			let salt: string = results[0].salt;
			let firstName: string = results[0].firstName;
			let lastName: string = results[0].lastName;
			let email: string = results[0].email;
			let ranks: string[] = JSON.parse(results[0].ranks);

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
		} else {
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
	static async activateAccount(userId: string) {
		let query = 'UPDATE users SET isActivated = 1 WHERE id = ?';

		let [results, fields] = await db.execute<OkPacket>(query, [userId]);
		if (results.affectedRows == 1) {
			return true;
		}
		return false;
	}
	static async checkiIfaccountIsActivated(userId: string) {
		let query = 'SELECT isActivated FROM users WHERE id = ?';
		let [results, fields] = await db.execute<RowDataPacket[]>(query, [userId]);

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
	static async resendEmailIftokenTooOld(hashId: string, userId: string) {
		let age = SnowflakeID.getDataFromID(hashId).age;
		let email: string;
		if (age > 3) {
			let query = 'SELECT email, isActivated FROM users WHERE id = ?';

			let [results, fields] = await db.execute<RowDataPacket[]>(query, [
				userId,
			]);

			//sends email with new code

			if (results.length > 0) {
				email = results[0].email;
			} else {
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

	static async updateToken(userId: string, tokens: string[]) {
		let token = crypto.randomBytes(100).toString('base64url');
		tokens.push(token);
		let query = 'UPDATE users SET tokens = ? WHERE id = ?';
		let result = await db.execute<OkPacket>(query, [
			JSON.stringify(tokens),
			userId,
		]);
		if (result[0].affectedRows == 1) {
			return { token: token, isOkay: true };
		}
		return { isOkay: false };
	}

	static async isLoggedIn(email: string, token: string, id: string) {
		let query = 'SELECT tokens FROM users WHERE email = ? AND id = ?';
		let [results, fields] = await db.execute<RowDataPacket[]>(query, [
			email,
			id,
		]);
		if (results.length > 0) {
			let tokens: tokens = JSON.parse(results[0].tokens);
			let index = tokens.indexOf(token);
			if (index > -1) {
				return true;
			}
		}
		return false;
	}
	static async logout(email: string, token: string, id: string) {
		let query = 'SELECT id, tokens FROM users WHERE email = ?';
		let [results, fields] = await db.execute<RowDataPacket[]>(query, [email]);
		if (results.length > 0) {
			let userId: string = results[0].id;
			let tokens: tokens = JSON.parse(results[0].tokens);
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
	static async getDataFromToken(token: string, id: string) {
		let query =
			'SELECT id,firstName,lastName,email tokens FROM users WHERE id = ?';
		let [results, fields] = await db.execute<RowDataPacket[]>(query, [id]);
		if (results.length > 0) {
			let tokens: tokens = JSON.parse(results[0].tokens);
			let index = tokens.indexOf(token);
			if (index > -1 && results[0].id == id) {
				return {
					isOkay: true,

					firstName: results[0].firstName,
					lastName: results[0].lastName,
					email: results[0].email,
				};
			}
		}
		return { isOkay: false };
	}
}

export default UserManagement;
