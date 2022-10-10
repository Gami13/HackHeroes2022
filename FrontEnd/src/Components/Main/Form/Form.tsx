import React from 'react';
import Box from '../Box/Box';

interface FormProps {
	gap?: number;
	className?: string;
	onSubmit?: (e: React.FormEvent<HTMLFormElement>) => void;
	children?: any;
}

function Form(props: FormProps) {
	let gap = props.gap ? props.gap : 1;
	gap = gap / 4;

	return (
		<Box>
			<form
				className={props.className}
				onSubmit={props.onSubmit}
				style={{ gap: gap + 'rem' }}
			>
				{props.children}
			</form>
		</Box>
	);
}

export default Form;
