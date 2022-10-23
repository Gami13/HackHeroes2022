import { OkPacket, RowDataPacket } from 'mysql2';
import express, { Express, Request, Response } from 'express';
import db from './connection.js';
import UserManagement from './classes/UserManagement.js';
import SnowflakeID from './classes/Snowflake.js';

export default function publications(app: Express) {
	app.post('/publications', async (req, res) => {
		let wojewodztwo = req.body.wojewodztwo;
		let powiat = req.body.powiat;
		let gmina = req.body.gmina;

		let query =
			'SELECT `publication`.*, `users`.`firstName`, `users`.`lastName` FROM `publication`, `users` WHERE `users`.`id` = `publication`.`userId` AND `users`.`wojewodztwoId` = (SELECT `wojewodztwa`.`id` FROM `publication`, `wojewodztwa` WHERE ? = `wojewodztwa`.`name` LIMIT 1) AND `users`.`gminaId` = (SELECT `gminy`.`id` FROM `publication`, `gminy` WHERE ? = `gminy`.`name` LIMIT 1) AND `users`.`powiatId` = (SELECT `powiaty`.`id` FROM `publication`, `powiaty` WHERE ? = `powiaty`.`name` LIMIT 1) ORDER BY `publication`.`id` DESC;';
		let [results] = await db.query<RowDataPacket[]>(query, [
			wojewodztwo,
			gmina,
			powiat,
		]);
		if (results.length == 0) return res.sendSuccess({ publications: [] }, 404);

		let r = results.map((a) => {
			return {
				...a,
				footer: JSON.parse(a.footer),
				date: SnowflakeID.getDataFromID(a.id).date,
			};
		});
		// query = 'SELECT * FROM `tags` WHERE id in (?)';
		// let [tags] = await db.query<RowDataPacket[]>(query, [
		// 	r.map((a) => a.footer),
		// ]);

		// console.log('tags:', tags);
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

	app.post('/userWPG', async (req, res) => {
		let userId = req.body.userId; // PIETRUSZKA help

		let query =
			'SELECT `wojewodztwa`.`name` AS wojName, `powiaty`.`name` AS powName, `gminy`.`name` AS gminName FROM `wojewodztwa`, `powiaty`, `gminy`, `users` WHERE `wojewodztwa`.`id` = `users`.`wojewodztwoId` AND `powiaty`.`id` = `users`.`powiatId` AND `gminy`.`id` = `users`.`gminaId` AND `users`.`id` = ?;';
		let [results] = await db.query<RowDataPacket[]>(query, [userId]);

		if (results.length == 0) return res.sendSuccess({ WPG: [] }, 404);

		res.sendSuccess({ WPG: results });
	});

	app.get('/publicationes/:id', async (req, res) => {
		let query =
			'SELECT `publication`.*, `users`.`firstName`, `users`.`lastName` FROM `publication`, `users` WHERE `publication`.`id` = ? AND `publication`.`userId` = `users`.`id`;';
		let [results] = await db.query<RowDataPacket[]>(query, [req.params.id]);

		if (results.length == 0) return res.sendError('No results', 404);

		let r = results.map((a) => {
			return {
				...a,
				footer: JSON.parse(a.footer),
				date: SnowflakeID.getDataFromID(a.id).date,
			};
		});
		//query tags
		query = 'SELECT * FROM `tags` WHERE id = ?';
		for (let a of r) {
			for (let i = 0; i < a.footer.length; i++) {
				let [results] = await db.query<RowDataPacket[]>(query, [a.footer[i]]);
				a.footer[i] = results[0];
			}
		}

		res.sendSuccess({ publication: r[0] });
	});

	app.get('/tags', async (req, res) => {
		let query = 'SELECT * FROM `tags`';
		let [results] = await db.query<RowDataPacket[]>(query);
		if (results.length == 0) return res.sendError('No results', 404);
		res.sendSuccess({ tags: results });
	});
	app.get('/ranks', async (req, res) => {
		let query = 'SELECT * FROM `ranks`';
		let [results] = await db.query<RowDataPacket[]>(query);
		if (results.length == 0) return res.sendError('No results', 404);
		res.sendSuccess({ tags: results });
	});

	app.post('/publication', async (req, res) => {
		let title = req.body.title;
		let body = req.body.body;
		let tags = req.body.tags || [];
		let userId = req.body.userId;
		let email = req.body.email;
		let token = req.body.token;

		if (!(await UserManagement.isLoggedIn(email, token, userId))) {
			res.sendError('Not logged in', 401);
			return false;
		}
		if (!Array.isArray(tags)) {
			res.sendError('Invalid tags', 400);
			return false;
		}

		let snowflake = SnowflakeID.createID('010');
		let query =
			'INSERT INTO `publication` (`id`,`title`, `body`, `userId`, `footer`, `gminaId`, `powiatId`, `wojewodztwoId`) VALUES (?, ?, ?, ?, ?, (SELECT `gminy`.`id` FROM `users`, `gminy` WHERE `gminy`.`id` = `users`.`gminaId` AND `users`.`id` = ?), (SELECT `powiaty`.`id` FROM `users`, `powiaty` WHERE `powiaty`.`id` = `users`.`powiatId` AND `users`.`id` = ?), (SELECT `wojewodztwa`.`id` FROM `users`, `wojewodztwa` WHERE `wojewodztwa`.`id` = `users`.`wojewodztwoId` AND `users`.`id` = ?))';

		let [results] = await db.query<OkPacket>(query, [
			snowflake,
			title,
			body,
			userId,
			JSON.stringify(tags),
			userId,
			userId,
			userId,
		]);
		if (results.affectedRows == 0)
			return res.sendError('Failed to create publication', 500);
		res.sendSuccess({ message: 'Publication created' });
	});
	console.green('Publications Routes Loaded ✔');
}
