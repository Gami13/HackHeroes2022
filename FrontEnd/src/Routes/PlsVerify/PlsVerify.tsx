import { useState } from 'react';
import Box from './../../Components/Main/Box/Box';
import style from './PlsVerify.module.css';

const PlsVerify = () => {
	return (
		<Box>
			<span className={style.content}>
				<h1>
					<a href="mailto:">Zweryfikuj</a> adres email.
				</h1>
			</span>
		</Box>
	);
};
export default PlsVerify;
