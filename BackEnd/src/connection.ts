import * as mysql from 'mysql2/promise';
const db = await mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'Obywatel++',
	supportBigNumbers: true,
	bigNumberStrings: true,
});
export default db;
