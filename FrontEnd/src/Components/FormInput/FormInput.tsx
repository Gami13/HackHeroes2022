import React from 'react';
import Input from '../Main/Input/Input';
import style from './FormInput.module.css';

interface FormInputProps {
	id: string;
	type: string;
	width?: string;
	value?: string;
	className?: string;
	placeholder?: string;
	label?: string;
	errors?: string;
	onChange?: (event: React.ChangeEvent<HTMLInputElement>) => void;
	onBlur?: (event: React.FocusEvent<HTMLInputElement>) => void;
}

function FormInput(props: FormInputProps) {
	let width = props.width ? props.width : '24rem';

	return (
		<label htmlFor={props.id}>
			
				<span>{props.label}</span>
				<span className={style.error}>{props.errors}</span>
			

			<Input
				id={props.id}
				type={props.type}
				width={width}
				value={props.value}
				className={style.input}
				onChange={props.onChange}
				onBlur={props.onBlur}
			/>
		</label>
	);
}

export default FormInput;
