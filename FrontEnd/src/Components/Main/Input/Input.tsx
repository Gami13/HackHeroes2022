import React from 'react';
import style from './Input.module.css';

interface InputProps {
	id?: string;
	type: string;
	width?: string;
	value?: string;
	className?: string[] | string;
	placeholder?: string;
	maxLength?: number;
	minLength?: number;
	list?: string;
	disabled?: boolean;
	onChange?: (event: React.ChangeEvent<HTMLInputElement>) => void;
	onBlur?: (event: React.FocusEvent<HTMLInputElement>) => void;
	form?: string;
}

function Input(props: InputProps) {
	const {
		id,
		type,
		width,
		value,
		className,
		placeholder,
		list,
		onChange,
		onBlur,
	} = props;

	return (
		<input
			disabled={props.disabled}
			id={id}
			type={type}
			value={value}
			className={[style.input, className].flat().join(' ')}
			placeholder={placeholder}
			onChange={onChange}
			onBlur={onBlur}
			style={{ width: width }}
			list={list}
			form={props.form}
			maxLength={props.maxLength}
			minLength={props.minLength}
		></input>
	);
}

Input.defaultProps = {};

export default Input;
