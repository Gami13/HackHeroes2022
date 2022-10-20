import { useContext, useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import style from './BookMeeting.module.css';
import States from '../../Components/States';
import PersonCard from '../../Components/PersonCard/PersonCard';
import Filters from '../../Components/Filters/Filters';
import DataList from '../../Components/DataList/DataList';
import layouts from '../../layouts.module.css';

const BookMeeting = () => {
	function come() {
		alert('please come in');
	}
	const [voivodeship, setVoivodeship] = useState('');
	const [county, setCounty] = useState('');
	const [town, setTown] = useState('');
	const [countyList, setCountyList] = useState(['test', 'test2', 'test3']);
	const [townList, setTownList] = useState(['test4', 'test5', 'test6']);
	const context = useContext(States);
	function fetchCounties() {
		/* TODO: Fetch counties */
	}
	function fetchTowns() {
		/* TODO: Fetch towns */
	}
	useEffect(() => {
		/* TODO: Fetch people */
	}, [voivodeship, county, town]);
	return (
		<div className={layouts.center}>
			<Filters heading="Umów spotkanie">
				<DataList
					title="Województwo: "
					id="wojewodztwa"
					data={['Małopolska', 'Śląskie', 'Mazowieckie']}
					onChange={(e) => setVoivodeship(e.target.value)}
					onBlur={fetchCounties}
					placeholder="Województwo"
				/>
				<DataList
					title="Powiat: "
					id="powiat"
					data={countyList}
					onChange={(e) => setCounty(e.target.value)}
					disabled={voivodeship == ''}
					onBlur={fetchTowns}
					placeholder="Powiat"
				/>
				<DataList
					title="Gmina: "
					id="gmina"
					data={townList}
					onChange={(e) => setTown(e.target.value)}
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
				id={5834527345}
			/>
		</div>
	);
};
export default BookMeeting;
