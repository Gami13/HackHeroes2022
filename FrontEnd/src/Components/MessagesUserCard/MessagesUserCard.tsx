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
	const navigate = useNavigate();
	function bookMeeting(id: string) {
		console.log(id);
		navigate('/booking/' + id.toString());
	}
	function askQuestion(id: string) {
		console.log(id);
		navigate('askQuestion/' + id.toString());
		alert('pytanie');
	}
	const context = React.useContext(States);
	return (
		<Box
			width="fit-content"
			backgroundColor={null}
			className={[style.MessagesUserCard, props.className, style.wrapper]
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
			<Tag
				text={props.position ? props.position : 'Nieznany'}
				backgroundColor="pink"
			/>
		</Box>
	);
};
export default MessagesUserCard;
