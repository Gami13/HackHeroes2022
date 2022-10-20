import React, { useContext } from 'react';
import { useNavigate } from 'react-router-dom';
import Box from '../Main/Box/Box';
import style from './PersonCard.module.css';
import Tag from '../Main/Tag/Tag';
import Button from '../Main/Button/Button';
import States from '../States';
interface PersonCardProps {
	className?: string[] | string;

	name?: string;
	position?: string;
	image?: string;
	description?: string;
	voivodeship?: string;
	county?: string;
	town?: string;
	id?: number;
	noButtons?: boolean;

	action?: (e: any) => void;
}

const PersonCard = (props: PersonCardProps) => {
	const navigate = useNavigate();
	function bookMeeting(id: number) {
		console.log(id);
		navigate('booking/' + id.toString());

		alert('rezerwacja');
	}
	function askQuestion(id: number) {
		console.log(id);
		navigate('askQuestion/' + id.toString());
		alert('pytanie');
	}
	const context = React.useContext(States);
	return (
		<Box
			width="fit-content"
			backgroundColor={null}
			className={[style.personCard, props.className, style.wrapper].join(' ')}
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
			{props.noButtons ? null : (
				<div className={style.buttons}>
					<Button
						className={style.askQuestion}
						onClick={() => {
							askQuestion(props.id!);
						}}
						disabled={!context.isLoggedIn}
					>
						Zadaj Pytanie
					</Button>
					<Button
						className={style.bookMeeting}
						onClick={() => {
							bookMeeting(props.id!);
						}}
						disabled={!context.isLoggedIn}
					>
						Umów spotkanie
					</Button>
				</div>
			)}
		</Box>
	);
};
export default PersonCard;
