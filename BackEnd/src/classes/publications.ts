import { RowDataPacket } from 'mysql2';
import express, { Express, Request, Response } from 'express';
import db from '../connection.js';
import UserManagement from './UserManagement.js';

export default function publications(app: Express) {
	app.get('/publications', async (req, res) => {
		let query =
			'SELECT `publication`.*, `users`.`firstName`, `users`.`lastName` FROM `publication`, `users` WHERE `users`.`id` = `publication`.`userId`;';
		let [results] = await db.query<RowDataPacket[]>(query);
		if (results.length == 0) return res.sendError('No results', 404);
		console.log(results);
		let r = results.map((a) => {
			return { ...a, footer: JSON.parse(a.footer) };
		});

		res.sendSuccess({ publications: r });
	});

	app.post('/tags/', async (req, res) => {
		let tags = req.body.tags || [];
		console.log(typeof req.body.tags);
		let queryAddon = tags.map((tag: any) => {
			return `\`id\` = '${tag}'`;
		});
		let query = 'SELECT * FROM `tags` WHERE ' + queryAddon.join(' OR');
		let [results] = await db.query<RowDataPacket[]>(query);
		if (results.length == 0) return res.sendError('No results', 404);
		res.sendSuccess({ tags: results });
	});
	app.post('/publication', (req, res) => {
		let title = req.body.title;
		let body = req.body.body;
		let date = req.body.date;
		let tags = req.body.tags || [];
		let userId = req.body.userId;
		let email = req.body.email;
		let token = req.body.token;

		if (!UserManagement.isLoggedIn(email, token, userId)) {
			res.sendError('Not logged in', 401);
			return false;
		}
		if (!Array.isArray(tags)) {
			res.sendError('Invalid tags', 400);
			return false;
		}

		let query =
			'INSERT INTO `publication` (`title`, `body`, `date`, `userId`,`footer`) VALUES (?, ?, ?, ?, ?)';
		db.query(query, [title, body, date, userId, tags]);
	});
	console.green('Publications Routes Loaded ✔');
}
