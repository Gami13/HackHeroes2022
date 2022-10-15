import { OkPacket, ResultSetHeader, RowDataPacket } from 'mysql2';
import db from './connection.js';
import { gminy, powiaty, wojewodztwa } from './data.js';

// let gminy: { name: string; powiat: string }[] = [];
// let powiaty: { name: string; wojewodztwo: string }[] = [];
// let wojewodztwa: string[] = [];

let wojIds: number[] = [];
let powIds: number[] = [];

async function insertwojewodztwa() {
	//insert to wojewodztwa name use multiquery and get inserted id
	let query = 'INSERT INTO wojewodztwa (name) VALUES ?';

	//remove duplicates
	let wojUnique = [...new Set(wojewodztwa)];

	let res = await db.query<ResultSetHeader>(query, [
		wojUnique.map((name) => [name]),
	]);
	console.log(res[0].insertId);
	for (let i = res[0].insertId; i < res[0].insertId + wojUnique.length; i++) {
		wojIds.push(i);
	}
	console.log(wojIds);
}
async function insertpowiaty() {
	console.log(powiaty.map((powiat) => [powiat.name, wojIds[0]]));
	//remove duplicates

	//insert to powiaty name and wojewodztwo id use multiquery and get inserted id
	let query = 'INSERT INTO powiaty (name, wojId) VALUES ?';
	let res = await db.query<ResultSetHeader>(query, [
		powiaty.map((powiat) => [powiat.name, wojIds[powiat.wojewodztwo]]),
	]);
	console.log(res[0].insertId);
	for (let i = res[0].insertId; i < res[0].insertId + powiaty.length; i++) {
		powIds.push(i);
	}
	console.log(powIds);
}
async function insertgminy() {
	//remove duplicates

	//insert to gminy name and powiat id use multiquery and get inserted id
	let query = 'INSERT INTO gminy (name, powId) VALUES ?';
	let res = await db.query<ResultSetHeader>(query, [
		gminy.map((gmina) => [gmina.name, powIds[gmina.powiat]]),
	]);
	console.log(res[0].insertId);
}
async function clearAllTables() {
	let query = 'DELETE FROM gminy;';
	let res = await db.query<ResultSetHeader>(query);

	console.log(res);
	query = 'DELETE FROM powiaty;';
	res = await db.query<ResultSetHeader>(query);
	console.log(res);
	query = 'DELETE FROM wojewodztwa;';
	res = await db.query<ResultSetHeader>(query);
	console.log(res);
}

export default async function insertAll() {
	await clearAllTables();
	await insertwojewodztwa();
	await insertpowiaty();
	await insertgminy();
}
