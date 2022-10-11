import React from 'react';
import style from './ButtonSec.module.css';

interface ButtonSecProps {
	type?: 'submit' | 'button';
	onClick?: any;
	children?: any;
}

function ButtonSec(props: ButtonSecProps) {
	const { type, onClick, children } = props;

	return (
		<button type={type} className={style.button} onClick={onClick}>
			{children}
		</button>
	);
}

ButtonSec.defaultProps = {
	type: 'button',
};

export default ButtonSec;
