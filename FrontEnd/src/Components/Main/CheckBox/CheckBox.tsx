import React from 'react';
import style from './CheckBox.module.css';
import { useState } from 'react';

interface CheckBoxProps {
	id?: string;
	// width?: string;
	// height?: string;
	className?: string[] | string;
}

function CheckBox(props: CheckBoxProps) {
	const { id, className } = props;

	return (
		<input
			id={id}
			type="checkbox"
			className={[style.checkbox, className].join(' ')}
			// style={{ width: width, height: height }} chyba niepotrzebne
		></input>

		// <div className={!check ? style.form_input : style.form_input_checked}>
		// 	<input
		// 		type="checkbox"
		// 		className={[style.checkbox, className].join(' ')}
		// 		id={id}
		// 		// style={{ width: width, height: height }} chyba niepotrzebne
		// 		onChange={() => setCheck(!check)}
		// 	/>
		// 	<span className={style.wrapper}>
		// 		<span className={check ? style.tick : null}></span>
		// 	</span>
		// </div>
	);
}

export default CheckBox;
