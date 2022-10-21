import { OkPacket, RowDataPacket } from 'mysql2';
import express, { Express, Request, Response } from 'express';
import db from './connection.js';
export default function comments(app: Express) {
	app.get('/comments', async (req, res) => {
		let query = 'SELECT * FROM `comments`';
		let [results] = await db.query<RowDataPacket[]>(query);
		if (results.length == 0) return res.sendError('No results', 404);
		res.sendSuccess({ comments: results });
	});
	app.post('/comment', async (req, res) => {
		let title = req.body.title;
		let body = req.body.body;
		let date = req.body.date;
		let query = 'INSERT INTO `comments` (`id`,`title`, `date`) VALUES (?,?,?)';

		let [results] = await db.query<OkPacket>(query, [title, date]);
		res.sendSuccess({ id: results.insertId });
	});
	console.green('Comments Routes Loaded ✔');
}
