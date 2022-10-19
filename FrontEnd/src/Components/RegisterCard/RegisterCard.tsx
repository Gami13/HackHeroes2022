import { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import style from './RegisterCard.module.css';
import Box from '../Main/Box/Box';
interface RegisterCardProps {
	firstName: string;
	lastName: string;
	email: string;
	dateOfBirth: Date;
	gender: string;
	voivodeship: string;
	county: string;
	town: string;
	className?: string[] | string;
	isPreviewed?: boolean;
}

function fillwithBlank(string: string, min = 4) {
	let newString = '';
	for (let i = 0; i < min; i++) {
		newString += '?';
	}
	for (let i = 0; i < string.length; i++) {
		newString =
			newString.substring(0, i) + string[i] + newString.substring(i + 1);
	}
	return newString;
}

const RegisterCard = (props: RegisterCardProps) => {
	const [cardFirstName, setCardFirstName] = useState('');
	const [cardEmail, setCardEmail] = useState('');
	const [cardLastName, setCardLastName] = useState('');
	const [cardVoivodeship, setCardVoivodeship] = useState('');
	const [cardCounty, setCardCounty] = useState('');
	const [cardTown, setCardTown] = useState('');
	const [cardDateOfBirth, setCardDateOfBirth] = useState('????.??.??');
	const [cardGender, setCardGender] = useState('?');

	useEffect(() => {
		setCardFirstName(fillwithBlank(props.firstName));
	}, [props.firstName]);
	useEffect(() => {
		setCardLastName(fillwithBlank(props.lastName));
	}, [props.lastName]);

	useEffect(() => {
		setCardEmail(fillwithBlank(props.email));
	}, [props.email]);
	useEffect(() => {
		setCardVoivodeship(fillwithBlank(props.voivodeship));
	}, [props.voivodeship]);
	useEffect(() => {
		setCardCounty(fillwithBlank(props.county));
	}, [props.county]);
	useEffect(() => {
		setCardTown(fillwithBlank(props.town));
	}, [props.town]);

	return (
		<Box
			display="grid"
			gridTemplateColumns="8rem 1fr"
			width="fit-content"
			height="fit-content"
			justify="start"
			items="start"
			className={`${props.isPreviewed ? style.registerCard : null}`}
		>
			<Box backgroundColor={null} display="flex">
				<svg
					xmlns="http://www.w3.org/2000/svg"
					width="6rem"
					height="6rem"
					fill="currentColor"
					viewBox="0 0 16 16"
				>
					<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
					<path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12z" />
				</svg>
			</Box>
			<Box
				className={style.data}
				width="fit-content"
				items="start"
				padding="0 1rem 0 1rem"
				gap="0.5rem"
			>
				<h1 className={style.title}>Obywatel++</h1>
				<div className={style.mainData}>
					<div className={style.firstName}>
						<span>Imie:</span>
						<p className={style.registerCardText}>{cardFirstName}</p>
					</div>
					<div className={style.lastName}>
						<span>Nazwisko:</span>
						<p className={style.registerCardText}>{cardLastName}</p>
					</div>
					<div className={style.email}>
						<span>E-Mail:</span>
						<p className={style.registerCardText}>{cardEmail}</p>
					</div>
				</div>

				<div className={style.secondaryData}>
					<div>
						<span>Zamieszkanie:</span>
						<p
							title={cardVoivodeship + ' - ' + cardCounty + ' - ' + cardTown}
							className={style.registerCardText}
						>
							{cardVoivodeship} - {cardCounty} - {cardTown}
						</p>
					</div>
					<div>
						<div>
							<span>Data Urodzenia:</span>
							<p className={style.registerCardText}>
								{new Intl.DateTimeFormat('en-UK').format(props.dateOfBirth)}
							</p>
						</div>

						<div>
							<span>Płeć:</span>
							<p className={style.registerCardText}>{props.gender}</p>
						</div>
					</div>
				</div>
			</Box>
		</Box>
	);
};
export default RegisterCard;
