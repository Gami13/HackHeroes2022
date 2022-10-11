import React, { CSSProperties } from 'react';
import Box from '../Box/Box';
import style from './PopUp.module.css';
import type { Property } from 'csstype';

interface PopUpProps {
	width?: string;
	height?: string;
	padding?: string;
	backgroundColor?: Property.BackgroundColor;
	justify?: 'center' | 'start' | 'end' | 'left' | 'right' | string;
	items?: 'center' | 'start' | 'end' | 'left' | 'right' | string;
	direction?: 'column' | 'row' | string;
	children?: any;
}

function PopUp(props: PopUpProps) {
	const { width, height, justify, items, direction, children, padding } = props;

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
			<Box width={width} height={height} padding={padding}>
				{children}
			</Box>
		</div>
	);
}

PopUp.defaultProps = {
	width: 'min-content',
	height: 'min-content',
	justify: 'center',
	items: 'center',
	direction: 'column',
};

export default PopUp;
