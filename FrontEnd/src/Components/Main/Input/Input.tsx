import React from 'react';

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
	let width = props.width ? props.width : '24rem';

	return (
		<input
			id={props.id}
			type={props.type}
			value={props.value}
			className={props.className}
			placeholder={props.placeholder}
			onChange={props.onChange}
			onBlur={props.onBlur}
			style={{ width: width }}
		></input>
	);
}

export default Input;
