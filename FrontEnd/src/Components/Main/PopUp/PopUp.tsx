import React from 'react';
import Box from '../Box/Box';
import style from './PopUp.module.css';

interface PopUpProps {
	children?: any;
}

function PopUp(props: PopUpProps) {
	return (
		<div className={style.bigBlack}>
			<Box>{props.children}</Box>
		</div>
	);
}

export default PopUp;
