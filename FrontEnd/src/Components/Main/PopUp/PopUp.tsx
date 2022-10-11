import React, { CSSProperties } from 'react';
import Box from '../Box/Box';
import style from './PopUp.module.css';

interface PopUpProps {
	width?: string;
	height?: string;
	justify?: 'flex-center' | string;
	items?: 'flex-center' | string;
	direction?: 'column' | 'row' | string;
	children?: any;
}

function PopUp(props: PopUpProps) {
	let justify = props.justify ? props.justify : 'center';
	let items = props.items ? props.items : 'center';
	let direction = props.direction ? props.direction : 'column';
	let width = props.width ? props.width : 'min-content';
	let height = props.height ? props.height : 'min-content';

	return (
		<div
			className={style.bigBlackContent}
			style={
				{
					justifyContent: justify,
					alignItems: items,
					flexDirection: direction,
				} as CSSProperties
			}
		>
			<Box width={width} height={height}>
				{props.children}
			</Box>
		</div>
	);
}

export default PopUp;
