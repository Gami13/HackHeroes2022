import React from 'react';

interface ButtonProps {
	onClick?: any;
	children?: any;
}

function Button(props: ButtonProps) {
	return <button onClick={props.onClick}>{props.children}</button>;
}

export default Button;
