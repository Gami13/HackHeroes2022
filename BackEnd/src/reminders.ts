import { OkPacket, RowDataPacket } from 'mysql2';
import express, { Express, Request, Response } from 'express';
import db from './connection.js';
import SnowflakeID from './classes/Snowflake.js';
import UserManagement from './classes/UserManagement.js';
export default function reminders(app: Express) {
	app.post('/getReminders', async (req, res) => {
		let email = req.body.email || '';
		let token = req.body.token || '';
		let userId = req.body.userId || '0';
		if (!(await UserManagement.isLoggedIn(email, token, userId))) {
			res.sendError('Not logged in', 401);
			return false;
		}
		let query = 'SELECT * FROM `reminders` WHERE `userId` = ?';
		let [results] = await db.query<RowDataPacket[]>(query, [userId]);
		if (results.length == 0) return res.sendError('No results', 404);
		res.sendSuccess({ reminders: results });
	});
	app.post('/reminder', async (req, res) => {
		let title = req.body.title;
		let body = req.body.body;
		let date = req.body.date;
		let query = 'INSERT INTO `reminders` (`id`,`title`, `date`) VALUES (?,?,?)';

		let [results] = await db.query<OkPacket>(query, [title, date]);
		res.sendSuccess({ id: results.insertId });
	});
	app.post('/reminders', async (req, res) => {
		console.log(req.body);
		let reminders = req.body.data;
		let email = req.body.email;
		let token = req.body.token;
		let userId = req.body.userId;
		if (!(await UserManagement.isLoggedIn(email, token, userId))) {
			return res.sendError('You are not logged in', 401);
		}
		// insert into database or update if exists
		res.sendSuccess('ok');
	});
	app.delete('/reminder', async (req, res) => {
		let id = req.body.id;
		let query = 'DELETE FROM `reminders` WHERE `id` = ?';
		let [results] = await db.query<OkPacket>(query, [id]);
		res.sendSuccess({ id: results.insertId });
	});
	console.green('Reminders Routes Loaded ✔');
}
