import {Connection,RowDataPacket} from "mysql2"
class DataValidation {
	static isUserDataValid(username:string, email:string, password:string, passwordConfirm:string) {
		if (
			DataValidation.validateUsername(username).length == 0 &&
			DataValidation.validateEmail(email).length == 0 &&
			DataValidation.validatePassword(password, passwordConfirm)
		) {
			return true;
		}
	}
	static validateUsername(username:string) {
		let usernameErrors:string[] = [];
		if (username.includes('#')) {
			usernameErrors.push('- Cannot contain #');
		}
		if (username.length < 3 || username.length > 32) {
			usernameErrors.push('- Must be between 3 and 32 characters');
		}
		return usernameErrors;
	}
	static validateEmail(email:string) {
		let emailErrors:string[] = [];

		if (email.length < 3) {
			emailErrors.push('- Must be at least 3 characters');
		}

		if (!email.includes('@')) {
			emailErrors.push('- Must be in the correct format');
		}
		return emailErrors;
	}
	static validatePassword(password:string, passwordConfirm:string) {
		let passwordErrors:string[] = [];
		if (password.length < 8 || password.length > 64) {
			passwordErrors.push('- Must be between 8 and 64 characters');
		}
		if (!/[0-9]/.test(password)) {
			passwordErrors.push('- Must contain at least one number');
		}
		if (!/[a-zA-Z]/.test(password)) {
			passwordErrors.push('- Must contain at least one letter');
		}
		if (password != passwordConfirm) {
			passwordErrors.push('- Passwords must match');
		}
		return passwordErrors;
	}

	static isUserAvailable(username:string, email:string, db:any) {
		return new Promise(async (resolve, reject) => {
			const query =
				'SELECT id FROM users WHERE username = ? OR email = ? LIMIT 1';
			console.log('checking if user is available');
			let [results, fields] = await db.execute(query, [username, email]);
			if (results.length > 0) {
				resolve(false);
			} else {
				resolve(true);
			}
		});
	}
}

export default DataValidation;
