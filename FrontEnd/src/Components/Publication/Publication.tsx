import React from 'react';
import style from './Publication.module.css';
import { useNavigate } from 'react-router-dom';
import Box from '../Main/Box/Box';

interface PublicationProps {
	width?: string;
	height?: string;
	user: string;
	date: string | null;
	title: any;
	body: any;
	footer: any[] | any;
	className?: string[] | string;
	id: string;
	disabled?: boolean;
}

function Publication(props: PublicationProps) {
	const {
		width,
		height,
		user,
		date,
		title,
		body,
		footer,
		className,
		disabled,
	} = props;
	const navigate = useNavigate();

	return (
		<button
			className={[className, style.wrapper].flat().join(' ')}
			onClick={() => {
				navigate(`/publication/${props.id}`);
			}}
			disabled={disabled}
		>
			<Box
				className={[className, style.box].flat().join(' ')}
				width={width}
				height={height}
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

export default Publication;
