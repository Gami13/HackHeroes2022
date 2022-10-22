class SnowflakeID {
	static epoch = new Date(2022, 0, 1).getTime(); //get timestamp since Januray 1st 2022 in binary
	static numberInBatch = 0;

	static pad(input: string, desiredLength: number, whatToPadWith: string) {
		let amountToPad = desiredLength - input.length;
		for (let i = 0; i < amountToPad; i++) {
			input = whatToPadWith + input;
		}
		return input;
	}

	static createID(idType: string) {
		const currentDate = Date.now();
		let timestampBits = (currentDate - this.epoch).toString(2); //timestamp since epoch in bits
		let ID = SnowflakeID.pad(timestampBits, 41, '0');
		let numberInBatchBits = (this.numberInBatch++).toString(2);
		numberInBatchBits = SnowflakeID.pad(numberInBatchBits, 8, '0');
		ID += numberInBatchBits;
		let randomness = '';
		for (let i = 0; i < 11; i++) {
			randomness += Math.round(Math.random()).toString();
		}
		ID += randomness;
		ID += idType; // 000 = user, 001=verification, 010=article, 011=comment, 100=other, 101= message
		ID = BigInt(`0b${ID}`).toString();
		return ID;
	}
	static getDataFromID(id: string) {
		//convert id to binary

		id = BigInt(id).toString(2);

		id = SnowflakeID.pad(id, 63, '0');

		let timestampBits = id.substring(0, 41);
		let timestamp = parseInt(timestampBits, 2) + this.epoch;
		//convert timestamp to date in UTC format
		let date = new Date(timestamp);
		//age in days
		let age = Math.floor((Date.now() - timestamp) / (1000 * 60 * 60 * 24));

		let numberInBatchBits = id.substring(41, 49);
		let numberInBatch = parseInt(numberInBatchBits, 2);
		let idType = id.substring(60, 63);
		switch (idType) {
			case '000':
				idType = 'user';
				break;
			case '001':
				idType = 'verification';
				break;
			case '010':
				idType = 'article';
				break;
			case '011':
				idType = 'token';
				break;
			case '100':
				idType = 'password reset';
				break;
			case '101':
				idType = 'message';
				break;
			case '110':
				idType = 'other';
				break;
			case '111':
				idType = 'other';
				break;
			default:
				idType = 'unknown';
				break;
		}

		return {
			date: date,
			age: age,
			numberInBatch: numberInBatch,
			idType: idType,
		};
	}
}
export default SnowflakeID;
