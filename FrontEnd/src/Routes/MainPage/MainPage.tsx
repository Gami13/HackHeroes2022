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

	const isFirstRender = useIsFirstRender();
	if (isFirstRender) {
		let w = async () => {
			let res = await fetch('http://localhost:3000/wojewodztwa');
			let json = await res.json();
			setWojewodztwa(json.wojewodztwa);

			let res2 = await fetch(`http://localhost:3000/publications`);
			let json2 = await res2.json();
			setPublications(json2.publications);
			console.log(json2.publications);
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
				<DataList
					title="Tagi: "
					id="tagi"
					data={['frytak', 'lize', 'psy']}
					placeholder="Tagi"
				/>
				<DataList
					title="Autorzy: "
					id="autorzy"
					data={['frytak', 'lize', 'psy']}
					placeholder="Autorzy"
				/>

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
					className={style.addPublication}
					onClick={() => {
						setIsAddPublicationOpen(!isAddPublicationOpen);
					}}
				>
					{isAddPublicationOpen ? 'Ukryj' : 'Dodaj'} publikację
				</Button>
				<CreatePublication
					className={isAddPublicationOpen ? null : style.addPublicationInvis}
					date={new Date()}
					user={context.userFirstName + ' ' + context.userLastName}
					height="fit-content"
				></CreatePublication>
				{publications.map((pub: any, index: number) => (
					<Publication
						key={index}
						id={pub.id}
						date={new Intl.DateTimeFormat('en-Gb').format(new Date(pub.date))}
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
				))}

				<Publication
					id={'114234'}
					date="04/05/2021"
					user="Anna Marlena Wołoszyn III"
					title={'Plaaacki 🤤🤤🤤'}
					body={
						'Aaaa, ja bardzo lubię placki! Mają bardzo dobrą konsystencję, wszystkie placki są dobre, poza tymi jednymi plackami co znalazłam na drodze, one nie są dobre. Ale za to inne placki już są przeeepyszne! Mogła bym mówić o plackach caaały dzień. Ale są sprawy ważne i są placki, niestety teraz zajmę się sprawami ważnymi... Jak chodziłam po klatce schodowej poszukując placków, to niestety zauważyłam dużego pająka, który mnie przeraził, stoi przy tej pile mechanicznej, która nie jest zabezpieczona i dzieci z łatwością mogą się do niej dostać. Proszę, pozbądźcie się pająka, on nawet nie płąci ręty 😪'
					}
					footer={
						<>
							<Tag text="🥞 Placki" backgroundColor={'var(--green)'} />
							<Tag text="💢 Skarga" />
						</>
					}
				/>
				<Publication
					id={'1146574234'}
					date="04/05/2021"
					user="Marek"
					title={'Koszenie trawy'}
					body={
						'Szybki zarobek za skoszenie trawnika. Zapłacę 1zł za każdy metr kwadratowy. Koszenie trawnika w okolicy ul. Kolejowej 12. Zainteresowanych proszę o kontakt.'
					}
					footer={<Tag text="💸 Money" backgroundColor={'var(--green)'} />}
				/>
			</main>

			<div className={style.additionalElements}>
				<CalendarWithTags />
			</div>
		</div>
	);
};
/*  */
export default MainPage;
