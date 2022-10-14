import React from 'react';
import Box from '../Main/Box/Box';
import style from './PersonCard.module.css';
import Tag from '../Main/Tag/Tag';
interface PersonCardProps {
	className?: string[] | string;

	name?: string;
	position?: string;
	image?: string;
	description?: string;
	voivodeship?: string;
	county?: string;
	town?: string;

	action?: (e: any) => void;
}

const PersonCard = (props: PersonCardProps) => {
	return (
		<button onClick={props.action} className={style.wrapper}>
			<Box
				width="fit-content"
				backgroundColor={null}
				className={[style.personCard, props.className].join(' ')}
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
		</button>
	);
};
export default PersonCard;
