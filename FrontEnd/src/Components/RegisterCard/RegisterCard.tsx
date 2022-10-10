import { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import style from './RegisterCard.module.css';
interface RegisterCardProps {
	firstName: string;
	lastName: string;
	email: string;
}

function fillwithBlank(string: string, min = 4) {
	let newString = '';
	for (let i = 0; i < min; i++) {
		newString += '#';
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

	useEffect(() => {
		setCardFirstName(fillwithBlank(props.firstName));
	}, [props.firstName]);
	useEffect(() => {
		setCardLastName(fillwithBlank(props.lastName));
	}, [props.lastName]);

	useEffect(() => {
		setCardEmail(fillwithBlank(props.email));
	}, [props.email]);

	return (
		<div className={style.registerCard}>
			<div>
				<span>Imie:</span>
				<p>{cardFirstName}</p>
			</div>
			<div>
				<span>Nazwisko:</span>
				<p>{cardLastName}</p>
			</div>
			<div>
				<span>E-Mail:</span>
				<p>{cardEmail}</p>
			</div>
		</div>
	);
};
export default RegisterCard;
