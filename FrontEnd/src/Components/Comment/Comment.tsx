import React from 'react';
import style from './Comment.module.css';
import { useNavigate } from 'react-router-dom';
import Box from '../Main/Box/Box';

interface CommentProps {
	width?: string;
	height?: string;
	user: string;
	date: string | null;
	body: any;
	className?: string[] | string;
	id: string;
}

function Comment(props: CommentProps) {
	const { width, height, user, date, body, className } = props;
	const navigate = useNavigate();

	return (
		<>
			<Box
				className={[className, style.box].flat().join(' ')}
				width={width}
				height={height}
				display="grid"
				backgroundColor={null}
				gridTemplateColumns="1fr"
				gridTemplateRows="fit-content(1rem) 1fr"
				gap="0.5rem"
			>
				<div className={style.info}>
					<p>{user}</p>
					<p>{date}</p>
				</div>
				<div className={style.body}>{body}</div>
			</Box>
		</>
	);
}

export default Comment;
