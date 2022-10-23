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
		const email = req.body.email;
		const token = req.body.token;
		console.log(req.body);
		const photo = <UploadedFile>req.files?.photo;
		if (photo == undefined) {
			res.sendError('No photo', 400);
			return false;
		}
		console.log(req.files);

		if (!(await UserManagement.isLoggedIn(email, token, userId))) {
			res.sendError('Not logged in', 401);
			return false;
		}
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
	app.post('/getMessages', async (req, res) => {
		const userId = req.body.userId;
		const email = req.body.email;
		const token = req.body.token;
		const otherPerson = req.body.otherPerson;
		const alreadyFetched = req.body.alreadyFetched;
		if (!(await UserManagement.isLoggedIn(email, token, userId))) {
			res.sendError('Not logged in', 401);
			return false;
		}

		const sql = `SELECT * FROM messages WHERE (senderId = ? AND recipientId = ?) OR (senderId = ? AND recipientId = ?) AND messages.id NOT IN (0${
			alreadyFetched.length != 0 || alreadyFetched == null ? ',' : ' '
		} ${alreadyFetched.join(',')}) ORDER BY messages.id ASC`;
		const [results, fields] = await db.query<RowDataPacket[]>(sql, [
			userId,
			otherPerson,
			otherPerson,
			userId,
		]);
		if (results.length < 1) {
			res.sendError('No messages', 404);
			return false;
		}

		res.sendSuccess('Messages found', {
			results,
		});
	});
	app.post('/getDzbans', async (req, res) => {
		const userId = req.body.userId;
		const email = req.body.email;
		const token = req.body.token;
		if (!(await UserManagement.isLoggedIn(email, token, userId))) {
			res.sendError('Not logged in', 401);
			return false;
		}
		const query = `SELECT DISTINCT users.id, firstName, lastName, email, phoneNumber, description, photo, ranks, address, wojewodztwa.name as wojewodztwo, powiaty.name as powiat, gminy.name as gmina FROM users, wojewodztwa, powiaty, gminy, messages WHERE wojewodztwa.id = users.wojewodztwoId AND powiaty.id = users.powiatId AND gminy.id = users.gminaId AND ((messages.senderId = ? AND messages.recipientId = users.id) OR (messages.recipientId = ? AND messages.senderId = users.id)) AND users.id != ?;`;
		const [results, fields] = await db.query<RowDataPacket[]>(query, [
			userId,
			userId,
			userId,
		]);
		if (results.length < 1) {
			res.sendError('No users', 404);
			return false;
		}
		let tags = results.map((user) => {
			return JSON.parse(user.ranks);
		});
		let users = results.map((user) => {
			return {
				...results,
				ranks: JSON.parse(user.ranks),
			};
		});
		tags = tags.flat();
		//remove duplicates
		console.log(tags);
		tags = [...new Set(tags)];
		console.log(tags);
		let nulls = tags.filter((tag) => tag == null);
		if (nulls.length != tags.length) {
			let notNulls = tags.filter((tag) => tag != null);
			let sql = `SELECT ranks.name, ranks.color,ranks.id FROM ranks WHERE ranks.id IN (${notNulls.join(
				','
			)})`;
			const [results, fields] = await db.query<RowDataPacket[]>(sql);
			console.log('results', results);
			for (let i = 0; i < users.length; i++) {
				users[i].ranks = users[i].ranks.map((rank: any) => {
					console.log(rank);
					if (rank != null) {
						let found = results.find((result) => result.id == rank);
						if (found == undefined) {
							return null;
						}
						return { name: found.name, color: found.color };
					}
				});
				console.log('ranks', users[i].ranks);
			}
		}
		//console.log(users);
		res.sendSuccess('Users found', {
			users,
		});
	});
	app.post('/getUserData', async (req, res) => {
		const id = req.body.id || 0;
		let query =
			'SELECT users.id, firstName, lastName, email, phoneNumber, description, photo, ranks, address, wojewodztwa.name as wojewodztwo, powiaty.name as powiat, gminy.name as gmina FROM users, wojewodztwa, powiaty, gminy WHERE users.id = ? AND wojewodztwa.id = users.wojewodztwoId AND powiaty.id = users.powiatId AND gminy.id = users.gminaId;';
		let [results, fields] = await db.execute<RowDataPacket[]>(query, [id]);
		if (results.length == 0) {
			res.sendError('User not found', 404);
			return false;
		}
		let userId: string = results[0].id;

		let firstName: string = results[0].firstName;
		let lastName: string = results[0].lastName;
		let email: string = results[0].email;
		let phoneNumber: string = results[0].phoneNumber;
		let description: string = results[0].description;
		let ranksIds: string[] = JSON.parse(results[0].ranks || '[]');
		let address: string = results[0].address;
		let voivodeship: string = results[0].wojewodztwo;
		let county: string = results[0].powiat;
		let town: string = results[0].gmina;
		console.log(ranksIds, ranksIds.join(','));

		let ranks: any[] = [];
		if (ranksIds.length > 0) {
			let sql = `SELECT ranks.name, ranks.color FROM ranks WHERE ranks.id IN (${ranksIds.join(
				','
			)})`;
			let [result, fields2] = await db.execute<RowDataPacket[]>(sql);
			ranks = result;
		}
		res.sendSuccess({
			userId: userId,
			firstName: firstName,
			lastName: lastName,
			email: email,
			phoneNumber: phoneNumber,
			description: description,
			ranksIds: ranksIds,
			ranks: ranks,
			address: address,
			voivodeship: voivodeship,
			county: county,
			town: town,

			isOkay: true,
		});
		return true;
	});

	console.green('Messages Routes Loaded ✔');
}
