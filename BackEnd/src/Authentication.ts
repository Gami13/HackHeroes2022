import express, { Express, Request, Response } from 'express';
import { RowDataPacket } from 'mysql2';
import DataValidation from './classes/DataValidation.js';
import SnowflakeID from './classes/Snowflake.js';
import UserManagement from './classes/UserManagement.js';
import * as crypto from 'crypto';
import db from './connection.js';
export default function authentication(app: Express) {
	app.post('/registerUser', async (req: Request, res: Response) => {
		/* TODO: CHANGE USERNAME TO FIRST NAME AND LAST NAME !!!!VERY IMPORTANT!!!! */
		let response = '';
		let username = req.body.username;
		let email = req.body.email;
		let password = req.body.password;
		let passwordConfirm = req.body.passwordConfirm;

		if (
			!DataValidation.isUserDataValid(
				username,
				email,
				password,
				passwordConfirm
			)
		) {
			res.send({ status: 'error', message: 'Invalid form data' });
			return false;
		}

		let { hashedPassword, salt } = await UserManagement.hashPassword(password);
		let ID = SnowflakeID.createID('000');

		/* 	console.log(
            `Username: ${username} | E-Mail: ${email} | Password: | ${password} | PasswordCofirm: ${passwordConfirm} | HashedPassword: ${hashedPassword} | Salt: ${salt} | ID: ${ID} }`
        ); */
		let availability = await DataValidation.isUserAvailable(
			username,
			email,
			db
		);

		if (!availability) {
			res.send({
				status: 'error',
				message: 'Username or E-Mail already in use',
			});
			return false;
		}
		UserManagement.insertVerificationCode(ID, email);

		if (
			!(await UserManagement.insertUserData(
				ID,
				username,
				email,
				hashedPassword,
				salt
			))
		) {
			res.send({ status: 'error', message: 'Failed to register user' });
			return false;
		}

		res.send({ status: 'success', message: 'User registered successfully' });
		return true;
	});

	app.get('/verify/:id', async (req, res) => {
		//ADD CHECKING IF ACCOUNT ALREADY VERIFIED

		const hash = req.params.id;

		let { hashId, userId, isUsed, isOkay } =
			await UserManagement.getDataFromVerificationCode(hash);

		if (!isOkay) {
			res.send({
				status: 'error',
				message: 'Unable to find account correlating to your verification link',
			});
			return false;
		}

		if (isUsed == true) {
			res.send({
				status: 'error',
				message: 'The verification link has been used already',
			});
			return false;
		}

		let result = await UserManagement.resendEmailIftokenTooOld(hashId, userId);

		if (!result.isOkay) {
			res.send(JSON.stringify({ status: 'error', message: result.message }));
		}
		let isActivated = await UserManagement.checkiIfaccountIsActivated(userId);
		if (isActivated) {
			res.send({
				status: 'error',
				message: 'Your account has already been activated',
			});
			return false;
		}

		const wasCodeUsed = await UserManagement.setVerificationCodeToUsed(hash);
		console.log(wasCodeUsed);

		if (!wasCodeUsed) {
			res.status(500).send(
				JSON.stringify({
					status: 'error',
					message: 'Something went wrong, please try again later',
				})
			);
			return false;
		}

		if (await UserManagement.activateAccount(userId)) {
			res.send({ status: 'success', message: 'Verified Correctly' });
			return true;
		}

		res.status(500).send({ status: 'error', message: 'Something went wrong' });
		return false;
	});
	app.post('/sendPasswordReset', async (req, res) => {
		console.log(req.body);
		let email = req.body.email;
		let passResetID = SnowflakeID.createID('100');

		let query = 'SELECT id FROM users WHERE email = ?';
		let [results, fields] = await db.execute<RowDataPacket[]>(query, [email]);
		if (results.length > 0) {
			let userId = results[0].id;
			//create 200 character long hash
			let resetHash = crypto.randomBytes(100).toString('base64url');
			UserManagement.sendEmail(
				email,
				'Reset Hasla',
				'Resetuj swoje hasło na http://localhost/resetPassword/' + resetHash
			);
			query =
				'INSERT INTO passwordReset (id, userId,hash, isUsed) VALUES (?,?,?,false)';

			await db.execute(query, [passResetID, userId, resetHash]);
			res.send(
				JSON.stringify({
					status: 'success',
					message: 'Email with password reset code sent',
				})
			);
		} else {
			res.send({ status: 'error', message: 'Email not found' });
		}
	});
	app.post('/resetPassword', async (req, res) => {
		console.log(req.body);
		let token = req.body.token;
		let password = req.body.password;
		let passwordConfirm = req.body.passwordConfirm;
		let isPasswordOkay =
			DataValidation.validatePassword(password, passwordConfirm).length == 0;
		if (!isPasswordOkay) {
			res.send({
				status: 'error',
				message: 'Password is not valid, please try again',
			});
			return false;
		}
		//TODO: Put into separate function
		let query = 'SELECT userId, isUsed FROM passwordReset WHERE hash = ?';
		let [results, fields] = await db.execute<RowDataPacket[]>(query, [token]);
		if (results.length > 0) {
			let userId = results[0].userId;
			let isUsed = results[0].isUsed;
			if (isUsed == true) {
				res.send({
					status: 'error',
					message: 'The password reset link has been used already',
				});
				return false;
			}
			let { hashedPassword, salt } = await UserManagement.hashPassword(
				password
			);

			query = 'UPDATE users SET password = ?, salt = ? WHERE id = ?';
			db.execute(query, [hashedPassword, salt, userId]);
			query = 'UPDATE passwordReset SET isUsed = true WHERE hash = ?';
			db.execute(query, [token]);
			res.send({ status: 'success', message: 'Password reset correctly' });
			return true;
		}
	});
	//#region login and everything related to it
	app.post('/login', async (req, res) => {
		//SEND ACCOUNT DATA TO CLIENT
		let username = req.body.username; //username is either username or email
		let password = req.body.password;

		let { userId, isActivated, tokens, hashedPassword, salt, isOkay } =
			await UserManagement.getUserData(username, password);
		if (!isOkay) {
			res.send({ status: 'error', message: 'User not found' });
			return false;
		}

		if (isActivated == false) {
			res.send({
				status: 'error',
				message: 'Your account has not been activated yet',
			});
			return false;
		}
		let isPasswordCorrect = await UserManagement.checkPassword(
			password,
			salt,
			hashedPassword
		);
		if (isPasswordCorrect) {
			let { token, isOkay } = await UserManagement.updateToken(userId, tokens);
			if (!isOkay) {
				res.send(
					JSON.stringify({
						status: 'error',
						message: 'Something went wrong, please try again later',
					})
				);
				return false;
			}

			res.send(
				JSON.stringify({
					status: 'success',
					token: token,
					message: 'Logged in correctly',
				})
			);

			return true;
		} else {
			res.send({ status: 'error', message: 'Incorrect password' });
			return false;
		}
	});

	app.post('/isLoggedIn', async (req, res) => {
		let id = req.body.id;
		let username = req.body.username; //username is either username or email
		let token = req.body.token;
		if (await UserManagement.isLoggedIn(username, token, id)) {
			res.send({ status: 'success', message: 'Logged in' });
		} else {
			res
				.status(401)
				.send({ status: 'error', message: 'Something went wrong' });
		}
		return false;
	});
	app.post('/logout', async (req, res) => {
		let id = req.body.id;
		let username = req.body.username; //username is either username or email
		let token = req.body.token;
		if (await UserManagement.logout(username, token, id)) {
			res.send({ status: 'success', message: 'Logged out correctly' });
			return true;
		}
		res.send({ status: 'error', message: 'Something went wrong' });
		return false;
	});
	//#endregion
	console.green('Authentication Routes Loaded ✔');
}
