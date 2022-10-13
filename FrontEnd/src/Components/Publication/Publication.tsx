import React from 'react';
import style from './Publication.module.css';
import Box from '../Main/Box/Box';

interface PublicationProps {
	width?: string;
	height?: string;
	user: string;
	title: string;
	body: any;
	footer: any;
	className?: string[] | string;
}

function Publication(props: PublicationProps) {
	const { width, height, user, title, body, footer, className } = props;

	return (
		<Box
			width={width}
			height={height}
			display="grid"
			gridTemplateColumns="1fr"
			gridTemplateRows="1rem 2rem 1fr 2rem"
		>
			<p className={style.user}>{user}</p>
			<h1 className={style.title}>{title}</h1>
			<div className={style.body}>{body}</div>
			<div className={style.footer}>{footer}</div>
		</Box>
	);
}

Publication.defaultProps = {
	width: '24rem',
	height: '12rem',
};

export default Publication;
