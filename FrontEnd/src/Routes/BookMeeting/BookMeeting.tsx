import { useContext, useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import style from './BookMeeting.module.css';
import States from '../../Components/States';
import PersonCard from '../../Components/PersonCard/PersonCard';
import Filters from '../../Components/Filters/Filters';
import DataList from '../../Components/DataList/DataList';
import layouts from '../../layouts.module.css';
import useIsFirstRender from '../../isFirstRender';

const BookMeeting = () => {
	function come() {
		alert('please come in');
	}
	const [voivodeship, setVoivodeship] = useState<string | undefined>();
	const [county, setCounty] = useState<string | undefined>();
	const [town, setTown] = useState<string | undefined>();
	const [voivodeshipList, setVoivodeshipList] = useState<
		{ name: string; id: string }[]
	>([]);
	const [countyList, setCountyList] = useState<{ name: string; id: string }[]>(
		[]
	);
	const [townList, setTownList] = useState<{ name: string; id: string }[]>([]);
	const context = useContext(States);

	async function fetchVoivodeships() {
		const response = await fetch('http://localhost:3000/wojewodztwa', {
			method: 'GET',
			headers: {
				'Content-Type': 'application/json',
			},
		});
		const data = await response.json();
		console.log(data);
		setVoivodeshipList(data.wojewodztwa);
	}
	async function fetchCounties() {
		if (!voivodeship) {
			return;
		}
		console.log(voivodeship);
		/* TODO: Fetch counties */
		let res = await fetch(`http://localhost:3000/powiaty/${voivodeship}`, {
			method: 'GET',
			headers: {
				'Content-Type': 'application/json',
			},
		});
		let data = await res.json();
		console.log(data);
		setCountyList(data.powiaty);
	}
	async function fetchTowns() {
		if (!county) {
			return;
		}
		let res = await fetch(`http://localhost:3000/gminy/${county}`, {
			method: 'GET',
			headers: {
				'Content-Type': 'application/json',
			},
		});
		let data = await res.json();
		console.log(data);
		setTownList(data.gminy);
	}

	async function fetchPeople() {
		if (!town) {
			return;
		}
		let res = await fetch(`http://localhost:3000/users/${town}`, {
			method: 'GET',
			headers: {
				'Content-Type': 'application/json',
			},
		});
		let data = await res.json();
		console.log(data);
	}
	useEffect(() => {
		fetchPeople();
	}, [voivodeship, county, town]);

	useEffect(() => {
		fetchCounties();
	}, [voivodeship]);
	useEffect(() => {
		fetchTowns();
	}, [county]);

	if (useIsFirstRender()) {
		fetchVoivodeships();
	}

	return (
		<div className={layouts.center}>
			<Filters heading="Umów spotkanie">
				<DataList
					title="Województwo: "
					id="wojewodztwa"
					data={voivodeshipList.map((item) => item.name)}
					onChange={(e) => {
						setVoivodeship(
							voivodeshipList.find((item) => item.name === e.target.value)?.id
						);
					}}
					onBlur={fetchCounties}
					placeholder="Województwo"
				/>
				<DataList
					title="Powiat: "
					id="powiat"
					data={countyList.map((item) => item.name)}
					onChange={(e) => {
						setCounty(
							countyList.find((item) => item.name === e.target.value)?.id
						);
					}}
					disabled={voivodeship == null}
					onBlur={fetchTowns}
					placeholder="Powiat"
				/>
				<DataList
					title="Gmina: "
					id="gmina"
					data={townList.map((item) => item.name)}
					onChange={(e) => {
						setTown(townList.find((item) => item.name === e.target.value)?.id);
					}}
					disabled={county == ''}
					placeholder="Gmina"
				/>
			</Filters>
			{/* <h1>Book Meeting</h1> */}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				id={'106798720795811136'}
			/>
		</div>
	);
};
export default BookMeeting;
