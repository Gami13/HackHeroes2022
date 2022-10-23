import { useContext, useEffect, useState } from 'react';
import style from './MainPage.module.css';
import States from '../../Components/States';
import Publication from '../../Components/Publication/Publication';
import Tag from '../../Components/Main/Tag/Tag';
import Calendar from '../../Components/Main/Calendar/Calendar';
import DatePanel from 'react-multi-date-picker/plugins/date_panel';
import Box from '../../Components/Main/Box/Box';
import CalendarWithTags from '../../Components/CalendarWithTags/CalendarWithTags';
import Filters from '../../Components/Filters/Filters';
import DataList from '../../Components/DataList/DataList';
import Input from '../../Components/Main/Input/Input';
import FormInput from '../../Components/FormInput/FormInput';
import Button from '../../Components/Main/Button/Button';
import layouts from '../../layouts.module.css';
import CreatePublication from '../../Components/CreatePublication/CreatePublication';
import useIsFirstRender from '../../isFirstRender';
import MultiSelect from '../../Components/MultiSelect/MultiSelect';
import React from 'react';
import Label from '../../Components/Main/Label/Label';
interface tak {
	id: number;
	name: string;
}

async function fetchPowiaty(wojId: number) {
	const res = await fetch(`http://localhost:3000/powiaty/${wojId}`);
	const json = await res.json();
	return json;
}
async function fetchGminy(powId: number) {
	const res = await fetch(`http://localhost:3000/gminy/${powId}`);
	const json = await res.json();
	return json;
}

async function fetchTags(ids: number[]) {
	console.log(typeof ids, ids);
	const res = await fetch(`http://localhost:3000/tags`, {
		method: 'POST',
		body: JSON.stringify({ tags: ids }),
		headers: {
			'Content-Type': 'application/json',
		},
	});
	const json = await res.json();
	return json;
}

const MainPage = () => {
	const context = useContext(States);

	const [publications, setPublications] = useState([]);

	const [isAddPublicationOpen, setIsAddPublicationOpen] = useState(false);

	const [wojewodztwa, setWojewodztwa] = useState<tak[]>([]);
	const [wojewodztwaSelected, setWojewodztwaSelected] = useState<
		tak | undefined
	>();
	const [powiaty, setPowiaty] = useState<tak[]>([]);
	const [powiatySelected, setPowiatySelected] = useState<tak | undefined>();

	const [gminy, setGminy] = useState<tak[]>([]);
	const [gminySelected, setGminySelected] = useState<tak | undefined>();

	const [selections, setSelections] = React.useState<any>([]);
	const [tags, setTags] = React.useState<any>([]);

	const [calendarData, setCalendarData] = useState<any>({});

	const isFirstRender = useIsFirstRender();

	async function fetchPublications() {
		let res2 = await fetch(`http://localhost:3000/publications`);
		let json2 = await res2.json();
		setPublications(json2.publications);
		console.log(json2.publications);
	}

	if (isFirstRender) {
		let w = async () => {
			let res = await fetch('http://localhost:3000/wojewodztwa');
			let json = await res.json();
			setWojewodztwa(json.wojewodztwa);

			fetchPublications();

			res = await fetch('http://localhost:3000/getReminders', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json',
				},
				body: JSON.stringify({
					userId: context.userID,
					email: context.userEmail,
					token: context.userToken,
				}),
			});
			let data = await res.json();
			console.log(data);
			if (data.status === 'error') {
				return;
			}
			let titles = data.reminders.reduce(
				(acc: any, reminder: any, index: any) => {
					acc[new Date(reminder.date).getTime()] = reminder.title;
					return acc;
				},
				{}
			);
			setCalendarData(titles);
		};
		w();
		console.log('first render');
	}
	function updatePowiaty() {
		if (isFirstRender) return;
		console.log(wojewodztwa);

		fetchPowiaty(wojewodztwaSelected?.id || 0).then((res) => {
			console.log(res);
			if (res.powiaty) setPowiaty(res.powiaty);
		});
	}

	function updateGminy() {
		if (isFirstRender) return;
		console.log(powiaty);
		fetchGminy(powiatySelected?.id || 0).then((res) => {
			console.log(res);
			if (res.gminy) setGminy(res.gminy);
		});
	}

	return (
		<div className={layouts.center}>
			<Filters className={style.filters} heading="Wyszukiwanie">
				<div className={style.multiSelectLabel}>
					<span>Tagi:</span>
					<MultiSelect
						className={style.multiSelect}
						getFuncton={async (setTags) => {
							let res = await fetch('http://localhost:3000/tags');
							let json = await res.json();
							let data = json.tags.map((option: any, index: number) => ({
								value: option.id,
								label: (
									<Tag
										className={style.tag}
										text={option.text}
										backgroundColor={'var(--' + option.color + ')'}
									/>
								),
							}));
							setTags(
								data.map((option: any, index: number) => ({
									...option,
									id: index,
								})) || []
							);
						}}
						options={[]}
						returnSetter={setTags}
					/>
				</div>

				<DataList
					title="Województwo: "
					id="wojewodztwa"
					data={wojewodztwa.map((woj) => woj.name)}
					placeholder="Województwa"
					onChange={(e) => {
						setWojewodztwaSelected(
							wojewodztwa.find((woj) => woj.name == e.target.value)
						);
						if (wojewodztwaSelected) updatePowiaty();
					}}
				/>
				<DataList
					title="Powiat: "
					id="powiat"
					data={powiaty.map((pow) => pow.name)}
					placeholder="Powiat"
					onChange={(e) => {
						setPowiatySelected(
							powiaty.find((pow) => pow.name == e.target.value)
						);
						if (powiatySelected) {
							updateGminy();
						}
					}}
				/>
				<DataList
					title="Gmina: "
					id="gmina"
					data={gminy.map((gmin) => gmin.name)}
					onChange={(e) =>
						setGminySelected(gminy.find((gmin) => gmin.name == e.target.value))
					}
					placeholder="Gmina"
				/>
			</Filters>

			<main className={style.mainElements}>
				<Button
					disabled={!context.isLoggedIn}
					className={style.addPublication}
					onClick={() => {
						setIsAddPublicationOpen(!isAddPublicationOpen);
					}}
				>
					{isAddPublicationOpen ? 'Ukryj' : 'Dodaj'} publikację
				</Button>
				<CreatePublication
					className={[
						style.publication,
						isAddPublicationOpen ? null : style.addPublicationInvis,
					]}
					date={new Date()}
					user={context.userFirstName + ' ' + context.userLastName}
					height="fit-content"
					width="100%"
					afterAdded={() => {
						setIsAddPublicationOpen(false);
						fetchPublications();
					}}
				></CreatePublication>
				{publications
					? publications.map((pub: any, index: number) => (
							<Publication
								key={index}
								id={pub.id}
								className={[style.publication, style.pub]}
								date={new Intl.DateTimeFormat('en-Gb').format(
									new Date(pub.date)
								)}
								user={pub.firstName + ' ' + pub.lastName}
								title={pub.title}
								body={pub.body}
								footer={pub.footer.map((f: any, i: number) => (
									<Tag
										key={i}
										text={f.text}
										backgroundColor={'var(--' + f.color + ')'}
									/>
								))}
							></Publication>
					  ))
					: null}
			</main>

			<div className={style.additionalElements}>
				<CalendarWithTags tags={calendarData} />
			</div>
		</div>
	);
};
/*  */
export default MainPage;
