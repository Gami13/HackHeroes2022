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

const MainPage = () => {
	const context = useContext(States);
	return (
		<div className={layouts.center}>
			{/* <h1>Cześć</h1>
			<p>
				{context.isLoggedIn}, {context.userEmail}, {context.userFirstName},{' '}
				{context.userFirstName},{context.userEmail}, {context.userID},
				{context.userRanks}
			</p> */}
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
					data={['Małopolska', 'Śląskie', 'Mazowieckie']}
					placeholder="Województwo"
				/>
				<DataList
					title="Powiat: "
					id="powiat"
					data={['frytak', 'lize', 'psy']}
					placeholder="Powiat"
				/>
				<DataList
					title="Gmina: "
					id="gmina"
					data={['frytak', 'lize', 'psy']}
					placeholder="Gmina"
				/>
			</Filters>

			<main className={style.mainElements}>
				<Button className={style.addPublication}>+</Button>
				<CreatePublication height="fit-content"></CreatePublication>
				<Publication
					id={'1'}
					date="05/05/2021"
					user="Boby Drop Tables"
					title={
						'To trzeba zmienić! zmiana! zmiana zmiana zmiana zmiana! zmiana zmiana zmiana zmiana! zmiana zmiana zmiana zmiana! zmiana zmiana zmiana'
					}
					body={
						'Dzisiaj będąc w kawiarni zapomniałem wziąść ze sobą telefonu, który miałem na stoliku. Gdy przyszedłem następnego dnia, obsługa nie chciała mi go oddać, choć na moich oczach tego ranka jak wchodziłem to go zabierali sprzątając! 😡😡'
					}
					footer={
						<>
							<Tag text="Zgubione" emoji="🕸" />
							<Tag text="Skarga" emoji="💢" />
							<Tag text="Kawusia" emoji="☕" backgroundColor={'var(--blue)'} />
						</>
					}
				/>
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
							<Tag text="Placki" emoji="🥞" backgroundColor={'var(--green)'} />
							<Tag text="Skarga" emoji="💢" />
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
					footer={
						<Tag text="Money" emoji="💸" backgroundColor={'var(--green)'} />
					}
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
