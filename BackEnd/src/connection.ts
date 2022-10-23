import * as dotenv from 'dotenv';
dotenv.config({ path: './.env' });
import * as mysql from 'mysql2/promise';
const db = await mysql.createConnection({
	host: `${process.env.DB_HOST}`,
	user: `${process.env.DB_USER}`,
	database: `${process.env.DB_NAME}`,
	password: `${process.env.DB_PASS}`,
	supportBigNumbers: true,
	bigNumberStrings: true,
});
export default db;
