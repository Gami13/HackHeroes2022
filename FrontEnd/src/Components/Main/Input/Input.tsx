import React from 'react';
import style from './Input.module.css';

interface InputProps {
	id: string;
	type: string;
	width?: string;
	value?: string;
	className?: string;
	placeholder?: string;
	onChange?: (event: React.ChangeEvent<HTMLInputElement>) => void;
	onBlur?: (event: React.FocusEvent<HTMLInputElement>) => void;
}

function Input(props: InputProps) {
	const { id, type, width, value, className, placeholder, onChange, onBlur } =
		props;

	return (
		<input
			id={id}
			type={type}
			value={value}
			className={className}
			placeholder={placeholder}
			onChange={onChange}
			onBlur={onBlur}
			style={{ width: width }}
		></input>
	);
}

Input.defaultProps = {
	width: '24rem',
};

export default Input;
