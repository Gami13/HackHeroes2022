import React from 'react';

interface ButtonSecProps {
	onClick?: any;
	children?: any;
}

function ButtonSec(props: ButtonSecProps) {
	return <button onClick={props.onClick}>{props.children}</button>;
}

export default ButtonSec;
