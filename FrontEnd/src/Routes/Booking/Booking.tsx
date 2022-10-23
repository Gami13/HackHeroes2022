import { useContext, useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import PersonCard from '../../Components/PersonCard/PersonCard';
import style from './Booking.module.css';
import useIsFirstRender from '../../isFirstRender';
import Calendar from '../../Components/Main/Calendar/Calendar';
import TimePicker from 'react-multi-date-picker/plugins/time_picker';
import AnalogTimePicker from 'react-multi-date-picker/plugins/analog_time_picker';
import layouts from '../../layouts.module.css';
import Input from '../../Components/Main/Input/Input';
import FormInput from '../../Components/FormInput/FormInput';
import Label from '../../Components/Main/Label/Label';
import Select from '../../Components/Main/Select/Select';
import Button from '../../Components/Main/Button/Button';
import TextArea from '../../Components/Main/TextArea/TextArea';
import Tag from '../../Components/Main/Tag/Tag';

const Booking = () => {
	const [personImage, setPersonImage] = useState(
		'https://media.tenor.com/d8-MHhSV7OAAAAAS/dream-dream-smp.gif'
	);
	const [personName, setPersonName] = useState('');
	const [personPosition, setPersonPosition] = useState('');
	const [personDescription, setPersonDescription] = useState('');
	const [personVoivodeship, setpersonVoivodeship] = useState('');
	const [personCounty, setPersonCounty] = useState('');
	const [personTown, setPersonTown] = useState('');
	const isFirstRender = useIsFirstRender();
	const { id } = useParams();

	const [meatingReason, setMeatingReason] = useState('');
	const [meatingDate, setMeatingDate] = useState(new Date());

	async function fetchPerson() {
		//TODO: fetch person data
		let res = await fetch(`http://localhost:3000/getUserData`, {
			method: 'POST',
			headers: {
				Accept: 'application/json',
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				id: id,
			}),
		});
		let json = await res.json();

		//url to imgur image
		setPersonImage('http://localhost:3000/userProfileImage/' + json.userId);
		setPersonName(json.firstName + ' ' + json.lastName);
		console.log(json);
		setPersonPosition(
			json.ranks.map((rank: any, index: number) => (
				<Tag text={rank.name} backgroundColor={rank.color} key={index} />
			))
		);
		setPersonDescription(json.description);
		setpersonVoivodeship(json.voivodeship);
		setPersonCounty(json.county);
		setPersonTown(json.town);
	}

	if (isFirstRender) {
		fetchPerson();
	}
	/* TODO: Add day picker, add time picker, check if that time is available */
	return (
		<div className={[layouts.center, style.booking].flat().join(' ')}>
			<PersonCard
				className={style.person}
				image={personImage}
				name={personName}
				position={personPosition}
				description={personDescription}
				voivodeship={personVoivodeship}
				county={personCounty}
				town={personTown}
				id={id}
				noButtons={true}
			/>
			<div className={style.controls}>
				<Calendar
					className={style.calendar}
					value={meatingDate}
					onChange={setMeatingDate}
					multiple={false}
					plugins={[<AnalogTimePicker hideSeconds />]}
				/>
				<Label label="wybierz sposób spotkania" className={style.label}>
					<Select
						className={style.select}
						options={[
							{ value: '1', title: 'na miejscu' },
							{ value: '2', title: 'przez telefon' },
						]}
					></Select>
				</Label>
				<Label label="Powód spotkania">
					<TextArea
						className={style.textarea}
						minLength={10}
						placeholder="Podaj powód spotkania"
						maxLength={150}
					></TextArea>
				</Label>
				<Button>zarezerwuj</Button>
			</div>
		</div>
	);
};
export default Booking;
