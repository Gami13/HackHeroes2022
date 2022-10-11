import React from 'react';
import style from './CheckBox.module.css';

interface CheckBoxProps {
	id?: string;
	width?: string;
	height?: string;
}

function CheckBox(props: CheckBoxProps) {
	const { id, width, height } = props;

	return (
		<input
			id={id}
			type="checkbox"
			style={{ width: width, height: height }}
		></input>
	);
}

CheckBox.defaultProps = {
	width: '1.2rem',
	height: '1.2rem',
};

export default CheckBox;
