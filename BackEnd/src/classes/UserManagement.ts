import * as nodemailer from 'nodemailer';
import * as crypto from 'crypto';
import * as argon2 from 'argon2';
import SnowflakeID from './Snowflake.js';
import db from './../connection.js';
import type {OkPacket,RowDataPacket} from 'mysql2';

import type {Options} from 'nodemailer/lib/mailer';



class UserManagement {
	static SHOULD_SEND_EMAIL = false;
	
	static mail = nodemailer.createTransport<Options>({
		//TODO: change to service with no limits
		//@ts-ignore
		host: "smtp.office365.com",
		port: 587,
		secure: false, 
		auth: {
			user: 'gamiifrytak@outlook.com',
			pass: 'haslo123',
		},
		supportBigNumbers: true,
		bigNumberStrings: true,
	});
	static async insertVerificationCode(ID:string, email:string) {
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
	static sendEmail(recipient:string, subject:string, text:string) {
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
	static async hashPassword(password:string) {
		let salt = crypto.randomBytes(32).toString('base64');

		let hashedPassword = salt + password + '4m06u52u5'; //pepper
		//hash password
		hashedPassword = await argon2.hash(hashedPassword);
		return { hashedPassword: hashedPassword, salt: salt };
	}
	static async checkPassword(password:string, salt:string, hashedPassword:string) {
		password = salt + password + '4m06u52u5'; //pepper
		return await argon2.verify(hashedPassword, password);
	}
	static async setVerificationCodeToUsed(hash:String)
	{
		const query = 'UPDATE verifyaccount SET isUsed = true WHERE hash = ?';

		const [results, fields] = await db.execute<OkPacket>(query, [hash])
		if (results.affectedRows ==0 ) {
		return false;
	} 
}
static async getDataFromVerificationCode(hash:String)
{
	let query = 'SELECT userId, id, isUsed FROM verifyaccount WHERE hash = ?';
	let [results, fields] = await db.execute<RowDataPacket[]>(query, [hash]);

	if (results.length > 0) {
		console.log(results);
		return {hashId : results[0].id, userId : results[0].userId, isUsed : results[0].isUsed, isOkay : true};
	} else {
		return {isOkay : false};
	}
}
}

export default UserManagement;
