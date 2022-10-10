import { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import style from './RegisterCard.module.css';
interface RegisterCardProps {
	firstName: string;
	lastName: string;
	email: string;
}
const RegisterCard = (props: RegisterCardProps) => {
	const [cardFirstName, setCardFirstName] = useState('');
	const [cardEmail, setCardEmail] = useState('');
	const [cardLastName, setCardLastName] = useState('');
	useEffect(() => {
		switch (props.firstName.length) {
			case 0:
				setCardFirstName('####');
				break;
			case 1:
				setCardFirstName(props.firstName + '###');
				break;
			case 2:
				setCardFirstName(props.firstName + '##');
				break;
			case 3:
				setCardFirstName(props.firstName + '#');
				break;
			default:
				setCardFirstName(props.firstName);
				break;
		}
	}, [props.firstName]);
	useEffect(() => {
		switch (props.lastName.length) {
			case 0:
				setCardLastName('####');
				break;
			case 1:
				setCardLastName(props.lastName + '###');
				break;
			case 2:
				setCardLastName(props.lastName + '##');
				break;
			case 3:
				setCardLastName(props.lastName + '#');
				break;
			default:
				setCardLastName(props.lastName);
				break;
		}
	}, [props.lastName]);

	useEffect(() => {
		switch (props.email.length) {
			case 0:
				setCardEmail('####');
				break;
			case 1:
				setCardEmail(props.email + '###');
				break;
			case 2:
				setCardEmail(props.email + '##');
				break;
			case 3:
				setCardEmail(props.email + '#');
				break;
			default:
				setCardEmail(props.email);
				break;
		}
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
