import SnowflakeID from './classes/Snowflake.js';
import DataValidation from './classes/DataValidation.js';
import express, { Express, Request, Response } from 'express';
import * as crypto from 'crypto';
import cors from 'cors';
import db from './connection.js';
import UserManagement from './classes/UserManagement.js';
import { OkPacket, RowDataPacket } from 'mysql2';
import Log, { yes } from './classes/Log.js';

yes();

const app = express();
app.use(express.json());
app.use(cors());

app.listen(3000, () => {
	console.yellow(`
            k;double sin()
         ,cos();main(){float A=
       0,B=0,i,j,z[1760];char b[
     1760];printf("\\x1b[2J");for(;;
  ){memset(b,32,1760);memset(z,0,7040)
  ;for(j=0;6.28>j;j+=0.07)for(i=0;6.28
 >i;i+=0.02){float c=sin(i),d=cos(j),e=
 sin(A),f=sin(j),g=cos(A),h=d+2,D=1/(c*
 h*e+f*g+5),l=cos      (i),m=cos(B),n=s\\
in(B),t=c*h*g-f*        e;int x=40+30*D*
(l*h*m-t*n),y=            12+15*D*(l*h*n
+t*m),o=x+80*y,          N=8*((f*e-c*d*g
 )*m-c*d*e-f*g-l        *d*n);if(22>y&&
 y>0&&x>0&&80>x&&D>z[o]){z[o]=D;;;b[o]=
 ".,-~:;=!*#$@"[N>0?N:0];}}/*#****!!-*/
  printf("\\x1b[H");for(k=0;1761>k;k++)
   putchar(k%80?b[k]:10);A+=0.04;B+=
     0.02;}}/*****####*******!!=;:~
       ~::==!!!**********!!!==::-
         .,~~;;;========;;;:~-.
             ..,--------,*/`);
});

app.post('/registerUser', async (req: Request, res: Response) => {
	/* TODO: CHANGE USERNAME TO FIRST NAME AND LAST NAME !!!!VERY IMPORTANT!!!! */
	let response = '';
	let username = req.body.username;
	let email = req.body.email;
	let password = req.body.password;
	let passwordConfirm = req.body.passwordConfirm;

	if (
		!DataValidation.isUserDataValid(username, email, password, passwordConfirm)
	) {
		res.send('{"status": "error", "message": "Invalid form data"}');
		return false;
	}

	let { hashedPassword, salt } = await UserManagement.hashPassword(password);
	let ID = SnowflakeID.createID('000');

	/* 	console.log(
		`Username: ${username} | E-Mail: ${email} | Password: | ${password} | PasswordCofirm: ${passwordConfirm} | HashedPassword: ${hashedPassword} | Salt: ${salt} | ID: ${ID} }`
	); */
	let availability = await DataValidation.isUserAvailable(username, email, db);

	if (!availability) {
		res.send(
			'{"status": "error", "message": "Username or E-Mail already in use"}'
		);
		return false;
	}
	UserManagement.insertVerificationCode(ID, email);

	//TODO: Put into separate function
	let query =
		'INSERT INTO users (id, username, email, password, salt, isactivated) VALUES (?,?,?,?,?,false);';

	let [results, fields] = await db.execute<OkPacket>(query, [
		ID,
		username,
		email,
		hashedPassword,
		salt,
	]);

	if (results.affectedRows != 1) {
		res.send('{"status": "error", "message": "Failed to register user"}');
		return false;
	}

	res.send('{"status": "success", "message": "User registered successfully"}');
	return true;
});

app.get('/verify/:id', async (req, res) => {
	//ADD CHECKING IF ACCOUNT ALREADY VERIFIED

	const hash = req.params.id;

	let { hashId, userId, isUsed, isOkay } =
		await UserManagement.getDataFromVerificationCode(hash);

	if (!isOkay) {
		res.send(
			'{"status":"error", "message":"Unable to find account correlating to your verification link"}'
		);
	}

	if (isUsed == true) {
		res.send(
			'{"status":"error", "message":"The verification link has been used already"}'
		);
	}

	let age = SnowflakeID.getDataFromID(hashId).age;

	let email: string;

	//TODO: Put into separate function checking for correct age
	if (age > 3) {
		let query = 'SELECT email, isActivated FROM users WHERE id = ?';

		let [results, fields] = await db.execute<RowDataPacket[]>(query, [userId]);

		//sends email with new code

		if (results.length > 0) {
			email = results[0].email;
		} else {
			res.send(
				`{"status":"error", "message":"Something went wrong, please try again later"}`
			);
			return false;
		}
		UserManagement.insertVerificationCode(userId, email);

		res.send(
			'{"status":"error", "message":"The verification link has expired, new one has been sent to your e-mail"}'
		);
		return false;
	}
	//TODO: Put into separate function

	let query = 'SELECT isActivated FROM users WHERE id = ?';
	let [results, fields] = await db.execute<RowDataPacket[]>(query, [userId]);
	let isActivated = results[0].isActivated;
	if (isActivated == true) {
		res.send(
			'{"status":"error", "message":"Your account has already been activated"}'
		);
		return false;
	}

	const wasCodeUsed = await UserManagement.setVerificationCodeToUsed(hash);
	console.log(wasCodeUsed);

	if (!wasCodeUsed) {
		res.send(
			'{"status":"error", "message":"Something went wrong, please try again later"}'
		);
		return false;
	}

	//TODO: Put into separate function and check if rows affected is 1

	query = 'UPDATE users SET isActivated = 1 WHERE id = ?';

	[results, fields] = await db.execute(query, [userId]);

	res.send('{"status":"success", "message":"Verified Correctly"}');
	return true;
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
			'{"status":"success", "message":"Email with password reset code sent"}'
		);
	} else {
		res.send('{"status":"error", "message":"Email not found"}');
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
		res.send(
			'{"status":"error", "message":"Password is not valid, please try again"}'
		);
		return false;
	}
	//TODO: Put into separate function
	let query = 'SELECT userId, isUsed FROM passwordReset WHERE hash = ?';
	let [results, fields] = await db.execute<RowDataPacket[]>(query, [token]);
	if (results.length > 0) {
		let userId = results[0].userId;
		let isUsed = results[0].isUsed;
		if (isUsed == true) {
			res.send(
				'{"status":"error", "message":"The password reset link has been used already"}'
			);
			return false;
		}
		let { hashedPassword, salt } = await UserManagement.hashPassword(password);

		query = 'UPDATE users SET password = ?, salt = ? WHERE id = ?';
		db.execute(query, [hashedPassword, salt, userId]);
		query = 'UPDATE passwordReset SET isUsed = true WHERE hash = ?';
		db.execute(query, [token]);
		res.send('{"status":"success", "message":"Password reset correctly"}');
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
		res.send('{"status":"error", "message":"User not found"}');
		return false;
	}

	if (isActivated == false) {
		res.send(
			'{"status":"error", "message":"Your account has not been activated yet"}'
		);
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
				'{"status":"error", "message":"Something went wrong, please try again later"}'
			);
			return false;
		}

		res.send(
			`{"status":"success", "token":"${token}", "message":"Logged in correctly"}`
		);

		return true;
	} else {
		res.send('{"status":"error", "message":"Incorrect password"}');
		return false;
	}
});

app.post('/isLoggedIn', async (req, res) => {
	let id = req.body.id;
	let username = req.body.username; //username is either username or email
	let token = req.body.token;
	if (await UserManagement.isLoggedIn(username, token, id)) {
		res.send('{"status":"success", "message":"Logged in"}');
	} else {
		res.send({ status: 'error', message: 'Something went wrong' });
	}
	return false;
});
app.post('/logout', async (req, res) => {
	let id = req.body.id;
	let username = req.body.username; //username is either username or email
	let token = req.body.token;
	if (await UserManagement.logout(username, token, id)) {
		res.send('{"status":"success", "message":"Logged out correctly"}');
		return true;
	}
	res.send('{"status":"error", "message":"Something went wrong"}');
	return false;
});
//#endregion
