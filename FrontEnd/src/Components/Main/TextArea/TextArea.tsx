import React from 'react';
import style from './TextArea.module.css';

interface TextAreaProps {
	id?: string;
	text?: string;
	rows?: number;
	className?: string[] | string;
	placeholder?: string;
	maxLength?: number;
	minLength?: number;
	disabled?: boolean;
	form?: string;
	children?: any;
}

function TextArea(props: TextAreaProps) {
	const {
		id,
		className,
		placeholder,
		disabled,
		form,
		rows,
		maxLength,
		minLength,
		children,
	} = props;

	return (
		<textarea
			disabled={disabled}
			id={id}
			className={[style.input, className].join(' ')}
			placeholder={placeholder}
			form={form}
			rows={rows}
			maxLength={maxLength}
			minLength={minLength}
		>
			{children}
		</textarea>
	);
}

TextArea.defaultProps = {};

export default TextArea;
