import React from 'react';
import style from './Button.module.css';

interface ButtonProps {
	type?: 'submit' | 'button';
	onClick?: any;
	children?: any;
	className?: string[] | string;
}

function Button(props: ButtonProps) {
	const { type, onClick, children } = props;

	return (
		<button
			type={type}
			className={[style.button, props.className].join(' ')}
			onClick={onClick}
		>
			{children}
		</button>
	);
}

Button.defaultProps = {
	type: 'button',
};

export default Button;
