import express from 'express';
import { yes } from './Log.js';
class extend {
    static sendError(message, errorCode = 500) {
        let response = this;
        return response
            .status(errorCode)
            .send({ status: 'error', success: false, message: '' + message });
    }
    static sendSuccess(message, data = null) {
        let response = this;
        let msg = message;
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
