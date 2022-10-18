import { useState } from 'react';
import Box from './../../Components/Main/Box/Box';
import style from './PlsVerify.module.css';
import Button from '../../Components/Main/Button/Button';

const PlsVerify = () => {
	return (
		<Box width="fit-content">
			<svg
				xmlns="http://www.w3.org/2000/svg"
				width="128"
				height="128"
				fill="currentColor"
				className={style.svg}
				viewBox="0 0 16 16"
			>
				<path d="M2 2a2 2 0 0 0-2 2v8.01A2 2 0 0 0 2 14h5.5a.5.5 0 0 0 0-1H2a1 1 0 0 1-.966-.741l5.64-3.471L8 9.583l7-4.2V8.5a.5.5 0 0 0 1 0V4a2 2 0 0 0-2-2H2Zm3.708 6.208L1 11.105V5.383l4.708 2.825ZM1 4.217V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v.217l-7 4.2-7-4.2Z" />
				<path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm.5-5v1.5a.5.5 0 0 1-1 0V11a.5.5 0 0 1 1 0Zm0 3a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0Z" />
			</svg>
			<div className={style.text}>
				<h1>Wysłaliśmy ci na maila link weryfikacyjny.</h1>
				<h1>Sprawdź swoją pocztę.</h1>
			</div>
		</Box>
	);
};
export default PlsVerify;
