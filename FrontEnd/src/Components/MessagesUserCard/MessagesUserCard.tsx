import React, { useContext } from 'react';
import { useNavigate } from 'react-router-dom';
import Box from '../Main/Box/Box';
import style from './MessagesUserCard.module.css';
import Tag from '../Main/Tag/Tag';
import Button from '../Main/Button/Button';
import States from '../States';
interface MessagesUserCardProps {
	className?: string[] | string;

	name?: string;
	position?: string;
	image?: string;
	description?: string;
	voivodeship?: string;
	county?: string;
	town?: string;
	id?: string;
	noButtons?: boolean;

	action?: (e: any) => void;
}

const MessagesUserCard = (props: MessagesUserCardProps) => {
	const context = React.useContext(States);
	return (
		<Box
			width="fit-content"
			backgroundColor={null}
			className={[style.messagesUserCard, props.className, style.wrapper]
				.flat()
				.join(' ')}
		>
			<img
				src={props.image}
				alt={props.name}
				className={style['clip-animation']}
			/>
			<h2>{props.name}</h2>
			<span>
				{props.voivodeship} - {props.county} - {props.town}
			</span>
			<p>{props.description}</p>
			<div className={style.tags}>{props.position}</div>
		</Box>
	);
};
export default MessagesUserCard;
