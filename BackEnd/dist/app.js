import express from 'express';
import cors from 'cors';
import authentication from './Authentication.js';
import db from './connection.js';
import load from './classes/extensions.js';
import publications from './publications.js';
import reminders from './reminders.js';
import comments from './comments.js';
import messages from './messages.js';
import fileUpload from 'express-fileupload';
import { fileTypeFromBuffer } from 'file-type';
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
    let [results, fields] = await db.query(query);
    if (results.length == 0)
        return res.sendError('No results', 404);
    res.sendSuccess({ wojewodztwa: results });
});
app.get('/powiaty', async (req, res) => {
    let query = 'SELECT name,id FROM powiaty';
    let [results, fields] = await db.query(query);
    if (results.length == 0)
        return res.sendError('No results', 404);
    res.sendSuccess({ powiaty: results });
});
app.get('/powiaty/:wojId', async (req, res) => {
    let wojId = req.params.wojId || 0;
    let query = 'SELECT name,id FROM powiaty WHERE wojId = ?';
    let [results, fields] = await db.query(query, [wojId]);
    if (results.length == 0)
        return res.sendError('No results', 404);
    res.sendSuccess({
        powiaty: results,
    });
});
app.get('/gminy', async (req, res) => {
    let query = 'SELECT name,id FROM gminy';
    let [results, fields] = await db.query(query);
    if (results.length == 0)
        return res.sendError('No results', 404);
    res.sendSuccess({ gminy: results });
});
app.get('/gminy/:powId', async (req, res) => {
    let powId = req.params.powId || 0;
    let query = 'SELECT name,id FROM gminy WHERE powId = ?';
    let [results, fields] = await db.query(query, [powId]);
    if (results.length == 0)
        return res.sendError('No results', 404);
    res.sendSuccess({
        gminy: results,
    });
});
app.get('/userProfileImage/:userId', async (req, res) => {
    let userId = req.params.userId || 0;
    let query = 'SELECT photo FROM users WHERE id = ?';
    let [results, fields] = await db.query(query, [userId]);
    if (results.length == 0 || results[0].photo == null) {
        // let urls = [
        // 	'https://media.tenor.com/d8-MHhSV7OAAAAAS/dream-dream-smp.gif',
        // 	'https://media.tenor.com/yQNEexfp7oUAAAAS/dream-dream-minecraft.gif',
        // 	'https://media.tenor.com/03kIzIohoBUAAAAC/dream-team-dream-minecraft.gif',
        // 	'https://tenor.com/view/this-is-my-kingdom-come-gif-22105215.gif',
        // ];
        // let buffer = await (
        // 	await fetch(urls[Math.floor(Math.random() * urls.length)])
        // ).arrayBuffer();
        // let mimeTypes = (await fileTypeFromBuffer(Buffer.from(buffer))) || {
        // 	mime: 'image/gif',
        // };
        // res.setHeader('Content-Type', mimeTypes.mime);
        // console.log(await fileTypeFromBuffer(buffer));
        // res.send(Buffer.from(buffer));
        let svg = `
		
<svg xmlns="http://www.w3.org/2000/svg" height="48" width="48"><path d="M24 23.3q-3.85 0-6.3-2.45-2.45-2.45-2.45-6.3 0-3.85 2.45-6.3Q20.15 5.8 24 5.8q3.85 0 6.325 2.45t2.475 6.3q0 3.85-2.475 6.3Q27.85 23.3 24 23.3ZM6.75 41.9v-6.05q0-2.2 1.15-3.875 1.15-1.675 2.95-2.525 3.45-1.55 6.675-2.325Q20.75 26.35 24 26.35q3.3 0 6.5.8t6.6 2.3q1.9.8 3.05 2.475t1.15 3.925v6.05Zm4.7-4.7h25.1v-1.15q0-.75-.475-1.45T34.9 33.55q-3-1.4-5.525-1.925Q26.85 31.1 24 31.1q-2.8 0-5.425.525T13.05 33.55q-.7.35-1.15 1.05-.45.7-.45 1.45ZM24 18.6q1.75 0 2.9-1.15t1.15-2.9q0-1.8-1.15-2.925Q25.75 10.5 24 10.5t-2.9 1.125q-1.15 1.125-1.15 2.925 0 1.75 1.15 2.9T24 18.6Zm0-4.05Zm0 22.65Z"/></svg>`;
        let buffer = Buffer.from(svg);
        res.setHeader('Content-Type', 'image/svg+xml');
        res.send(buffer);
        return;
    }
    let mimeTypes = (await fileTypeFromBuffer(Buffer.from(results[0].photo))) || {
        mime: 'image/png',
    };
    res.setHeader('Content-Type', mimeTypes.mime);
    res.send(results[0].photo);
    //send get content type from buffer
});
app.get('/users', async (req, res) => {
    //get users.firstName,id,ranks,descripton all users with ranks not null
    let query = 'SELECT users.id,users.firstName,ranks,users.description FROM users WHERE ranks IS NOT NULL';
    let [results, fields] = await db.query(query);
    if (results.length == 0)
        return res.sendError('No results', 404);
    res.sendSuccess({ users: results });
});
app.post('/updateUserData', async (req, res) => {
    let { userId, description, ranks, photo } = req.body;
    let query = 'UPDATE users SET description = ?, ranks = ?, photo = ? WHERE id = ?';
    let [results, fields] = await db.query(query, [
        description || null,
        ranks || null,
        photo || null,
        userId || 0,
    ]);
    if (results.length == 0)
        return res.sendError('No results', 404);
    res.sendSuccess({ users: results });
});
