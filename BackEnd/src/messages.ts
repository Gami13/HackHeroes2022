import { OkPacket, RowDataPacket } from 'mysql2';
import express, { Express, Request, Response } from 'express';
import db from './connection.js';
import UserManagement from './classes/UserManagement.js';
import SnowflakeID from './classes/Snowflake.js';

import type { UploadedFile } from 'express-fileupload';

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
	app.post('/addPhoto', async (req, res) => {
		const userId = req.body.userId;
		// const email = req.body.email;
		// const token = req.body.token;
		console.log(req.body);
		const photo = <UploadedFile>req.files?.photo;
		if (photo == undefined) {
			res.sendError('No photo', 400);
			return false;
		}
		console.log(req.files);

		/* 	if (!(await UserManagement.isLoggedIn(email, token, userId))) {
			res.sendError('Not logged in', 401);
			return false;
		} */
		//update photo in database
		const sql = 'UPDATE users SET photo = ? WHERE id = ?';
		const [results, fields] = await db.query<OkPacket>(sql, [
			photo.data,
			userId,
		]);

		console.log(results, fields);
		if (results.affectedRows > 0) {
			res.sendSuccess('Photo added');
			return;
		}
		res.sendError('Photo not added', 500);
	});
	app.post('/getUserData', async (req, res) => {
		const id = req.body.id || 0;
		let query =
			'SELECT users.id, firstName, lastName, email, phoneNumber, description, photo, tags, address, wojewodztwa.name as wojewodztwo, powiaty.name as powiat, gminy.name as gmina FROM users, wojewodztwa, powiaty, gminy WHERE users.id = ? AND wojewodztwa.id = users.wojewodztwoId AND powiaty.id = users.powiatId AND gminy.id = users.gminaId;';
		let [results, fields] = await db.execute<RowDataPacket[]>(query, [id]);
		if (results.length > 0) {
			let userId: string = results[0].id;

			let firstName: string = results[0].firstName;
			let lastName: string = results[0].lastName;
			let email: string = results[0].email;
			let phoneNumber: string = results[0].phoneNumber;
			let description: string = results[0].description;
			let tags: string[] = JSON.parse(results[0].tags);
			let address: string = results[0].address;
			let voivodeship: string = results[0].wojewodztwo;
			let county: string = results[0].powiat;
			let town: string = results[0].gmina;

			res.sendSuccess({
				userId: userId,
				firstName: firstName,
				lastName: lastName,
				email: email,
				phoneNumber: phoneNumber,
				description: description,
				tags: tags,
				address: address,
				voivodeship: voivodeship,
				county: county,
				town: town,

				isOkay: true,
			});
			return;
		} else {
			res.sendError('User not found', 404);
		}
	});

	console.green('Messages Routes Loaded ✔');
}
