import React from 'react';
import style from './Publication.module.css';
import { useNavigate } from 'react-router-dom';
import Box from '../Main/Box/Box';

interface PublicationProps {
	width?: string;
	height?: string;
	user: string;
	date: string;
	title: any;
	body: any;
	footer: any[] | any;
	className?: string[] | string;
	id: string;
}

function Publication(props: PublicationProps) {
	const { width, height, user, date, title, body, footer, className } = props;
	const navigate = useNavigate();

	return (
		<button
			className={style.wrapper}
			onClick={() => {
				navigate(`/publication/${props.id}`);
			}}
		>
			<Box
				className={style.box}
				width={width}
				height={'fit-content'}
				display="grid"
				backgroundColor={null}
				gridTemplateColumns="1fr"
				gridTemplateRows="fit-content(1rem) fit-content(2rem) 1fr fit-content(1rem)"
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
		</button>
	);
}

Publication.defaultProps = {
	width: '40rem',
	height: '12rem',
};

export default Publication;
