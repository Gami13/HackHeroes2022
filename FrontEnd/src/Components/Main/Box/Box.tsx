import React, { CSSProperties } from 'react';
import style from './Box.module.css';
import type { Property } from 'csstype';

interface BoxProps {
	width?: string | null;
	height?: string | null;
	padding?: string | null;
	backgroundColor?: Property.BackgroundColor | null;
	display?: 'flex' | 'grid';
	justify?: 'center' | 'start' | 'end' | 'left' | 'right' | string | null;
	items?: 'center' | 'start' | 'end' | 'left' | 'right' | string | null;
	direction?: 'column' | 'row' | string | null;
	gridTemplateColumns?: string;
	gridTemplateRows?: string;
	gap?: string;
	children?: any;
	className?: string[] | string;
}

function Box(props: BoxProps) {
	const {
		display,
		width,
		height,
		padding,
		backgroundColor,
		justify,
		items,
		direction,
		gridTemplateColumns,
		gridTemplateRows,
		gap,
		children,
		className,
	} = props;

	return (
		<div
			className={[style.box, className].join(' ')}
			style={
				{
					display,
					width: width,
					height: height,
					padding: padding,
					backgroundColor: backgroundColor,
					justifyContent: justify,
					alignItems: items,
					flexDirection: direction,
					gridTemplateColumns: gridTemplateColumns,
					gridTemplateRows: gridTemplateRows,
					gap: gap,
				} as CSSProperties
			}
		>
			{children}
		</div>
	);
}

Box.defaultProps = {
	display: 'flex',
	justify: 'center',
	items: 'center',
	direction: 'column',
	padding: '1rem',
	width: 'min-content',
	height: 'min-content',
	backgroundColor: getComputedStyle(document.documentElement).getPropertyValue(
		'--depth3'
	),
};

export default Box;
