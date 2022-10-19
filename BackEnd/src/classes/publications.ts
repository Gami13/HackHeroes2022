import { RowDataPacket } from 'mysql2';
import express, { Express, Request, Response } from 'express';
import db from '../connection.js';

export default function publications(app: Express) {
	app.get('/publications', async (req, res) => {
		let query = 'SELECT * FROM `publication`';
		let [results] = await db.query<RowDataPacket[]>(query);
		if (results.length == 0) return res.sendError('No results', 404);
		res.sendSuccess({ publications: results });
	});
	console.green('Publications Routes Loaded ✔');
}
