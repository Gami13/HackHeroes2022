import express, { Response } from 'express';
import { yes } from './Log.js';
declare global {
	namespace Express {
		interface Response {
			sendError: (
				message: string | any,
				errorCode?: number | 404 | 401 | 500
			) => express.Response;
			sendSuccess: (message: string | any, ...data: any) => express.Response;
		}
	}
}
class extend {
	static sendError(
		message: string,
		errorCode: number | 404 | 401 | 500 = 500
	): express.Response {
		let response = this as unknown as Response;
		return response
			.status(errorCode)
			.send({ status: 'error', success: false, message: '' + message });
	}
	static sendSuccess(message: string, data: any = null): express.Response {
		let response = this as unknown as Response;
		let msg: string | undefined = message;

		if (typeof message === 'object') {
			data = message;
			msg = undefined;
		}
		return response.send({ status: 'success', succes: true, msg, ...data });
	}
}
const load = () => {
	yes();
	express.response.sendError = extend.sendError;
	express.response.sendSuccess = extend.sendSuccess;
};
export default load;
