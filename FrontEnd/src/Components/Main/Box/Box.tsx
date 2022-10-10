import React, { CSSProperties } from 'react';
import style from './Box.module.css';

interface BoxProps {
	justify?: string;
	items?: string;
	direction?: string;
	children?: any;
}

function Box(props: BoxProps) {
	let justify = props.justify ? props.justify : 'flex-center';
	let items = props.items ? props.items : 'flex-center';
	let direction = props.direction ? props.direction : 'column';

	return (
		<div
			className={style.box}
			style={
				{
					justifyContent: justify,
					alignItems: items,
					flexDirection: direction,
				} as CSSProperties
			}
		>
			{props.children}
		</div>
	);
}

export default Box;
