import { useState } from 'react';
import Box from './../../Components/Main/Box/Box';
import style from './PlsVerify.module.css';

const PlsVerify = () => {
	return (
		<Box>
			<span className={style.content}>
				<h1>Please verify your email address.</h1> <br />
				<a href="mailto:">(with link we send to your email)</a>
			</span>
		</Box>
	);
};
export default PlsVerify;
