import { OkPacket, RowDataPacket } from 'mysql2';
import express, { Express, Request, Response } from 'express';
import db from './connection.js';
import Snowflake from './classes/Snowflake.js';

export default function comments(app: Express) {
	app.get('/comments/:id', async (req, res) => {
		let query =
			'SELECT `users`.`firstName`, `users`.`lastName`, `comments`.* FROM `users`, `comments` WHERE `publicationId` = ? AND `comments`.`userId` = `users`.`id` ORDER BY `comments`.`id` DESC;';
		let [results] = await db.query<RowDataPacket[]>(query, [req.params.id]);
		if (results.length == 0) return res.sendError('No results', 404);

		let r = results;

		r.map((comment) => {
			comment.date = Snowflake.getDataFromID(comment.id).date;
		});

		res.sendSuccess({ comments: r });
	});

	app.post('/comment', async (req, res) => {
		let id = Snowflake.createID('110');
		let userId = req.body.userId;
		let publicationId = req.body.publicationId;
		let text = req.body.text;

		if (!userId || !publicationId || !text)
			return res.sendError('Invalid body', 400);

		if (text.length > 500 || text.length < 1)
			return res.sendError('Text is of inccorect length', 400);

		let query =
			'INSERT INTO `comments` (`id`, `userId`, `publicationId`, `text`) VALUES (?, ?, ?, ?)';
		let [results] = await db.query<OkPacket>(query, [
			id,
			userId,
			publicationId,
			text,
		]);
		res.sendSuccess({ id: results.insertId });
	});
	console.green('Comments Routes Loaded ✔');
}
