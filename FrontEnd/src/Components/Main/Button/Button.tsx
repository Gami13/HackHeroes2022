import React from 'react';
import style from './Button.module.css';

interface ButtonProps {
	type?: 'submit' | 'button';
	onClick?: () => void;
	children?: any;
	className?: string[] | string;
	disabled?: boolean;
}

function Button(props: ButtonProps) {
	const { type, onClick, children, disabled } = props;

	return (
		<button
			type={type}
			className={[style.button, props.className].flat().join(' ')}
			onClick={onClick}
			disabled={disabled}
		>
			{children}
		</button>
	);
}

Button.defaultProps = {
	type: 'button',
};

export default Button;
