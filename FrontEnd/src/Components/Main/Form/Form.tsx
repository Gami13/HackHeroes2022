import React from 'react';
import Box from '../Box/Box';
import style from './Form.module.css';
import type { Property } from 'csstype';

interface FormProps {
	width?: string;
	height?: string;
	gap?: number;
	backgroundColor?: Property.BackgroundColor;
	className?: string[] | string;
	children?: any;
	onSubmit?: (e: React.FormEvent<HTMLFormElement>) => void;
}

function Form(props: FormProps) {
	const { width, height, gap, className, children, onSubmit, backgroundColor } =
		props;

	return (
		<Box width={width} height={height} backgroundColor={backgroundColor}>
			<form
				className={([className].join(' '), style.form)}
				onSubmit={props.onSubmit}
				// @ts-ignore
				style={{ gap: gap + 'rem', padding: gap * 2 + 'rem' }}
			>
				{props.children}
			</form>
		</Box>
	);
}

Form.defaultProps = {
	width: 'min-content',
	height: 'min-content',
	gap: 1,
};

export default Form;
