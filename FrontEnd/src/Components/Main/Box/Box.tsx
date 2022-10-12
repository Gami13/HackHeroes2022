import React, { CSSProperties } from 'react';
import style from './Box.module.css';
import type { Property } from 'csstype';

interface BoxProps {
	width?: string;
	height?: string;
	padding?: string;
	backgroundColor?: Property.BackgroundColor;
	justify?: 'center' | 'start' | 'end' | 'left' | 'right' | string;
	items?: 'center' | 'start' | 'end' | 'left' | 'right' | string;
	direction?: 'column' | 'row' | string;
	children?: any;
	className?: string[] | string;
}

function Box(props: BoxProps) {
	const {
		width,
		height,
		padding,
		backgroundColor,
		justify,
		items,
		direction,
		children,
		className,
	} = props;

	return (
		<div
			className={[style.box, className].join(' ')}
			style={
				{
					width: width,
					height: height,
					padding: padding,
					backgroundColor: backgroundColor,
					justifyContent: justify,
					alignItems: items,
					flexDirection: direction,
				} as CSSProperties
			}
		>
			{children}
		</div>
	);
}

Box.defaultProps = {
	justify: 'center',
	items: 'center',
	direction: 'column',
	padding: '1rem',
	width: 'min-content',
	height: 'min-content',
	backgroundColor: getComputedStyle(document.documentElement).getPropertyValue(
		'--depth1'
	),
};

export default Box;
