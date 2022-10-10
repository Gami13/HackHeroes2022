import * as mysql from 'mysql2/promise';
const db = await mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'Obywatel++',
});
export default db;
