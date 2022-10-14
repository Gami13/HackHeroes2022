import React from 'react';
import style from './CheckBox.module.css';
import { useState } from 'react';

/* interface CheckBoxProps {
	id?: string;
	width?: string;
	height?: string;
	className?: string[] | string;
} 
 function CheckBox(props: CheckBoxProps) {
	const { id, width, height, className } = props;
 */
const CheckBox = () => {
	const [check, setCheck] = useState(false);
	console.log(check);
	return (
		<div className={!check ? style.form_input : style.form_input_checked}>
			<input
				type="checkbox"
				className={style.checkbox}
				onChange={() => setCheck(!check)}
			/>
			<span className={style.wrapper}>
				<span className={check ? style.tick : null}></span>
			</span>
		</div>
	);
};

export default CheckBox;
