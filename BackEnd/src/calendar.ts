import express, { Express, Request, Response } from 'express';
import { RowDataPacket } from 'mysql2';
import DataValidation from './classes/DataValidation.js';
import SnowflakeID from './classes/Snowflake.js';
import UserManagement from './classes/UserManagement.js';
import * as crypto from 'crypto';
import db from './connection.js';

export default function calendar(app: Express) {
    
}
