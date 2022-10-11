import React from 'react';
import style from './Button.module.css';

interface ButtonProps {
	type?: "submit" | "button";
	onClick?: any;
	children?: any;
}

function Button(props: ButtonProps) {
	return <button type={props.type} className={style.button} onClick={props.onClick}>{props.children}</button>;
}

export default Button;
