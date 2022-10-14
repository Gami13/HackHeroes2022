import React from 'react';
import style from './Publication.module.css';
import Box from '../Main/Box/Box';

interface PublicationProps {
	width?: string;
	height?: string;
	user: string;
	date: string;
	title: string;
	body: any;
	footer: any;
	className?: string[] | string;
}

function Publication(props: PublicationProps) {
	const { width, height, user, date, title, body, footer, className } = props;

	return (
		<Box
			width={width}
			height={'fit-content'}
			display="grid"
			gridTemplateColumns="1fr"
			gridTemplateRows="fit-content(1rem) 2rem 1fr fit-content(1rem)"
			gap="0.5rem"
		>
			<div className={style.info}>
				<p>{date}</p>
				<p>{user}</p>
			</div>
			<h1 className={style.title}>{title}</h1>
			<div className={style.body}>{body}</div>
			<div className={style.footer}>{footer}</div>
		</Box>
	);
}

Publication.defaultProps = {
	width: '36rem',
	height: '12rem',
};

export default Publication;
