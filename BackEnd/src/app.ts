import * as dotenv from 'dotenv';
dotenv.config({ path: './.env' });
import express, { Response } from 'express';
import cors from 'cors';

import authentication from './Authentication.js';
import db from './connection.js';
import { RowDataPacket } from 'mysql2';
import load from './classes/extensions.js';
import publications from './publications.js';
import reminders from './reminders.js';
import comments from './comments.js';
import messages from './messages.js';
import fileUpload from 'express-fileupload';
import fetch from 'node-fetch';
load();

const app = express();
app.use(express.json());
// app.use(express.urlencoded({ extended: true }));

app.use(cors());
app.use(fileUpload());

app.listen(3000, () => {
	console.green('Server started on port 3000');
	// 	console.yellow(`
	//             k;double sin()
	//          ,cos();main(){float A=
	//        0,B=0,i,j,z[1760];char b[
	//      1760];printf("\\x1b[2J");for(;;
	//   ){memset(b,32,1760);memset(z,0,7040)
	//   ;for(j=0;6.28>j;j+=0.07)for(i=0;6.28
	//  >i;i+=0.02){float c=sin(i),d=cos(j),e=
	//  sin(A),f=sin(j),g=cos(A),h=d+2,D=1/(c*
	//  h*e+f*g+5),l=cos      (i),m=cos(B),n=s\\
	// in(B),t=c*h*g-f*        e;int x=40+30*D*
	// (l*h*m-t*n),y=            12+15*D*(l*h*n
	// +t*m),o=x+80*y,          N=8*((f*e-c*d*g
	//  )*m-c*d*e-f*g-l        *d*n);if(22>y&&
	//  y>0&&x>0&&80>x&&D>z[o]){z[o]=D;;;b[o]=
	//  ".,-~:;=!*#$@"[N>0?N:0];}}/*#****!!-*/
	//   printf("\\x1b[H");for(k=0;1761>k;k++)
	//    putchar(k%80?b[k]:10);A+=0.04;B+=
	//      0.02;}}/*****####*******!!=;:~
	//        ~::==!!!**********!!!==::-
	//          .,~~;;;========;;;:~-.
	//              ..,--------,*/`);
});
authentication(app);
publications(app);
reminders(app);
comments(app);
messages(app);

app.get('/wojewodztwa', async (req, res) => {
	let query = 'SELECT * FROM wojewodztwa';
	let [results, fields] = await db.query<RowDataPacket[]>(query);
	if (results.length == 0) return res.sendError('No results', 404);
	res.sendSuccess({ wojewodztwa: results });
});
app.get('/powiaty', async (req, res) => {
	let query = 'SELECT name,id FROM powiaty';
	let [results, fields] = await db.query<RowDataPacket[]>(query);
	if (results.length == 0) return res.sendError('No results', 404);
	res.sendSuccess({ powiaty: results });
});
app.get('/powiaty/:wojId', async (req, res) => {
	let wojId = req.params.wojId || 0;
	let query = 'SELECT name,id FROM powiaty WHERE wojId = ?';
	let [results, fields] = await db.query<RowDataPacket[]>(query, [wojId]);
	if (results.length == 0) return res.sendError('No results', 404);
	res.sendSuccess({
		powiaty: results,
	});
});
app.get('/gminy', async (req, res) => {
	let query = 'SELECT name,id FROM gminy';
	let [results, fields] = await db.query<RowDataPacket[]>(query);
	if (results.length == 0) return res.sendError('No results', 404);
	res.sendSuccess({ gminy: results });
});
app.get('/gminy/:powId', async (req, res) => {
	let powId = req.params.powId || 0;
	let query = 'SELECT name,id FROM gminy WHERE powId = ?';
	let [results, fields] = await db.query<RowDataPacket[]>(query, [powId]);
	if (results.length == 0) return res.sendError('No results', 404);
	res.sendSuccess({
		gminy: results,
	});
});

app.get('/userProfileImage/:userId', async (req, res) => {
	let userId = req.params.userId || 0;
	let query = 'SELECT photo FROM users WHERE id = ?';
	let [results, fields] = await db.query<RowDataPacket[]>(query, [userId]);

	if (results.length == 0) {
		let urls = [
			'https://media.tenor.com/d8-MHhSV7OAAAAAS/dream-dream-smp.gif',
			'https://media.tenor.com/yQNEexfp7oUAAAAS/dream-dream-minecraft.gif',
			'https://media.tenor.com/03kIzIohoBUAAAAC/dream-team-dream-minecraft.gif',
			'https://tenor.com/view/this-is-my-kingdom-come-gif-22105215.gif',
		];
		let buffer = await (
			await fetch(urls[Math.floor(Math.random() * urls.length)])
		).arrayBuffer();
		res.setHeader('Content-Type', 'image/gif');
		res.send(Buffer.from(buffer));
		return;
	}
	res.send(results[0].photo);
	//send get content type from buffer
});
