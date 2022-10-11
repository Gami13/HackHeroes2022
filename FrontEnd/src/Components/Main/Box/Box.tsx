import React, { CSSProperties } from 'react';
import style from './Box.module.css';

interface BoxProps {
	width?: string;
	height?: string;
	justify?: 'flex-center' | string;
	items?: 'flex-center' | string;
	direction?: 'column' | 'row' | string;
	children?: any;
}

function Box(props: BoxProps) {
	let justify = props.justify ? props.justify : 'center';
	let items = props.items ? props.items : 'center';
	let direction = props.direction ? props.direction : 'column';
	let width = props.width ? props.width : 'min-content';
	let height = props.height ? props.height : 'min-content';

	return (
		<div
			className={style.box}
			style={
				{
					width: width,
					height: height,
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
