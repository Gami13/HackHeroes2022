import { useContext, useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import PersonCard from '../../Components/PersonCard/PersonCard';
import style from './Booking.module.css';
import useIsFirstRender from '../../isFirstRender';

const Booking = () => {
	const [personImage, setPersonImage] = useState('');
	const [personName, setPersonName] = useState('');
	const [personPosition, setPersonPosition] = useState('');
	const [personDescription, setPersonDescription] = useState('');
	const [personVoivodeship, setpersonVoivodeship] = useState('');
	const [personCounty, setPersonCounty] = useState('');
	const [personTown, setPersonTown] = useState('');
	const isFirstRender = useIsFirstRender();
	const { id } = useParams();
	function fetchPerson() {
		///TODO: fetch person data
		setPersonImage(
			'https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg'
		);
		setPersonName('Harry Potter');
		setPersonPosition('monitor');
		setPersonDescription(
			'Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈'
		);
		setpersonVoivodeship('Malopolska');
		setPersonCounty('Kraków');
		setPersonTown('Kraków');
	}
	if (isFirstRender) {
		fetchPerson();
	}
	/* TODO: Add day picker, add time picker, check if that time is available */
	return (
		<div className={style.booking}>
			<h1>Lubie miód: {id}</h1>
			<PersonCard
				image={personImage}
				name={personName}
				position={personPosition}
				description={personDescription}
				voivodeship={personVoivodeship}
				county={personCounty}
				town={personTown}
				id={5834527345}
				noButtons={true}
			/>
		</div>
	);
};
export default Booking;
