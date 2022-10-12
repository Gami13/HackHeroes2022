import React from 'react';
import Input from '../Main/Input/Input';
import style from './FormInput.module.css';

interface FormInputProps {
	id: string;
	type: string;
	width?: string;
	value?: string;
	className?: string[] | string;
	placeholder?: string;
	label?: string;
	errors?: string;
	onChange?: (event: React.ChangeEvent<HTMLInputElement>) => void;
	onBlur?: (event: React.FocusEvent<HTMLInputElement>) => void;
}

function FormInput(props: FormInputProps) {
	const {
		id,
		type,
		width,
		value,
		className,
		placeholder,
		label,
		errors,
		onChange,
		onBlur,
	} = props;

	return (
		<label htmlFor={id} className={[className].join(' ')}>
			<span className={style.formInputLabel}>{label}</span>
			<span className={style.error}>{errors}</span>

			<Input
				id={id}
				type={type}
				width={width}
				value={value}
				placeholder={placeholder}
				className={style.input}
				onChange={onChange}
				onBlur={onBlur}
			/>
		</label>
	);
}

FormInput.defaultProps = {
	width: '24rem',
};

export default FormInput;
