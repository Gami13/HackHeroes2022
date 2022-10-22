import { OkPacket, RowDataPacket } from 'mysql2';
import express, { Express, Request, Response } from 'express';
import db from './connection.js';
import UserManagement from './classes/UserManagement.js';
import SnowflakeID from './classes/Snowflake.js';

export default function messages(app: Express) {
	app.post('/sendMessage', async (req, res) => {
		console.log('test');
		let message = req.body.message;
		let recipientId = req.body.recipientId;
		let userId = req.body.userId;
		let email = req.body.email;
		let token = req.body.token;

		if (!(await UserManagement.isLoggedIn(email, token, userId))) {
			res.sendError('Not logged in', 401);
			return false;
		}
		const messageId = SnowflakeID.createID('101');
		const sql =
			'INSERT INTO messages (id, senderId, recipientId, message) VALUES (?, ?, ?, ?)';
		/*
			TODO: glupi typ */
		const [results, fields] = await db.query<any>(sql, [
			messageId,
			userId,
			recipientId,
			message,
		]);
		if (results.affectedRows > 0) {
			res.sendSuccess('Message sent');
		}
	});
	app.post('/getUserData', async (req, res) => {
		const id = req.body.id;
		let query =
			'SELECT id, firstName, lastName, email, phoneNumber, description, photo, tags, address FROM users WHERE id = ?';
		let [results, fields] = await db.execute<RowDataPacket[]>(query, [id]);
		if (results.length > 0) {
			let userId: string = results[0].id;

			let firstName: string = results[0].firstName;
			let lastName: string = results[0].lastName;
			let email: string = results[0].email;
			let phoneNumber: string = results[0].phoneNumber;
			let description: string = results[0].description;
			let photo: Buffer = results[0].photo;
			let tags: string[] = JSON.parse(results[0].tags);
			let address: string = results[0].address;
			res.sendSuccess({
				userId: userId,
				firstName: firstName,
				lastName: lastName,
				email: email,
				phoneNumber: phoneNumber,
				description: description,
				photo: photo,
				tags: tags,
				address: address,

				isOkay: true,
			});

			return {
				userId: userId,
				firstName: firstName,
				lastName: lastName,
				email: email,
				phoneNumber: phoneNumber,
				description: description,
				photo: photo,
				tags: tags,
				address: address,

				isOkay: true,
			};
		} else {
			res.sendError('User not found', 404);
		}
	});

	console.green('Messages Routes Loaded ✔');
}
