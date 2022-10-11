import React from 'react';
import Box from '../Box/Box';
import style from './Form.module.css';

interface FormProps {
	width?: string;
	height?: string;
	gap?: number;
	className?: string;
	onSubmit?: (e: React.FormEvent<HTMLFormElement>) => void;
	children?: any;
}

function Form(props: FormProps) {
	let width = props.width ? props.width : 'min-content';
	let height = props.height ? props.height : 'min-content';
	let gap = props.gap ? props.gap : 1;
	gap = gap / 4;

	return (
		<Box width={width} height={height}>
			<form
				className={(props.className, style.form)}
				onSubmit={props.onSubmit}
				style={{ gap: gap + 'rem', padding: gap * 2 + 'rem' }}
			>
				{props.children}
			</form>
		</Box>
	);
}

export default Form;
