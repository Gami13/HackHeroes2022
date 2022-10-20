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

		let r = results.map((a) => {
			return { ...a, footer: JSON.parse(a.footer) };
		});
		//query tags
		query = 'SELECT * FROM `tags` WHERE id = ?';
		for (let a of r) {
			for (let i = 0; i < a.footer.length; i++) {
				let [results] = await db.query<RowDataPacket[]>(query, [a.footer[i]]);
				a.footer[i] = results[0];
			}
		}

		res.sendSuccess({ publications: r });
	});

	app.get('/tags', async (req, res) => {
		let query = 'SELECT * FROM `tags`';
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
