import React from 'react';
import style from './ButtonSec.module.css';

interface ButtonSecProps {
	type?: "submit" | "button";
	onClick?: any;
	children?: any;
}

function ButtonSec(props: ButtonSecProps) {
	return <button type={props.type} className={style.button} onClick={props.onClick}>{props.children}</button>;
}

export default ButtonSec;