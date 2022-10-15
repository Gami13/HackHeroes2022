import React from 'react';
import Input from '../Main/Input/Input';
import Label from '../Main/Label/Label';
import style from './FormInput.module.css';

interface FormInputProps {
	id: string;
	type: string;
	width?: string;
	value?: string;
	className?: string[] | string;
	placeholder?: string;
	list?: string;
	maxLength?: number;
	minLength?: number;
	label?: string;
	errors?: string | null;
	onChange?: (event: React.ChangeEvent<HTMLInputElement>) => void;
	onBlur?: (event: React.FocusEvent<HTMLInputElement>) => void;
	form?: string;
}

function FormInput(props: FormInputProps) {
	const {
		id,
		type,
		width,
		value,
		className,
		placeholder,
		list,
		label,
		errors,
		onChange,
		onBlur,
	} = props;

	return (
		<Label htmlFor={id} className={[className].join(' ')} label={label}>
			<span className={style.error}>{errors}</span>

			<Input
				form={props.form}
				id={id}
				type={type}
				width={width}
				value={value}
				placeholder={placeholder}
				className={style.input}
				onChange={onChange}
				onBlur={onBlur}
				list={list}
			/>
		</Label>
	);
}

// FormInput.defaultProps = {
// 	width: '24rem',
// };

export default FormInput;
