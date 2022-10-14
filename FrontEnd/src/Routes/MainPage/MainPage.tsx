import { useContext, useEffect, useState } from 'react';
import style from './MainPage.module.css';
import States from '../../Components/States';
import Publication from '../../Components/Publication/Publication';
import Tag from '../../Components/Main/Tag/Tag';
import Calendar from '../../Components/Main/Calendar/Calendar';
import DatePanel from 'react-multi-date-picker/plugins/date_panel';
const MainPage = () => {
	const context = useContext(States);
	return (
		<div className={style.mainPage}>
			{/* <h1>Cześć</h1>
			<p>
				{context.isLoggedIn}, {context.userEmail}, {context.userFirstName},{' '}
				{context.userFirstName},{context.userEmail}, {context.userID},
				{context.userRanks}
			</p> */}

			<main>
				<div className={style.mainElements}>
					<Publication
						date="05/05/2021"
						user="Boby Drop Tables"
						title={'To trzeba zmienić!'}
						body={
							'Dzisiaj będąc w kawiarni zapomniałem wziąść ze sobą telefonu, który miałem na stoliku. Gdy przyszedłem następnego dnia, obsługa nie chciała mi go oddać, choć na moich oczach tego ranka jak wchodziłem to go zabierali sprzątając! 😡😡'
						}
						footer={
							<div>
								<Tag text="Zgubione" emoji="🕸" />
								<Tag text="Skarga" emoji="💢" />
								<Tag
									text="Kawusia"
									emoji="☕"
									backgroundColor={'var(--blue)'}
								/>
							</div>
						}
					/>
					<Publication
						date="04/05/2021"
						user="Anna Marlena Wołoszyn III"
						title={'Plaaacki 🤤🤤🤤'}
						body={
							'Aaaa, ja bardzo lubię placki! Mają bardzo dobrą konsystencję, wszystkie placki są dobre, poza tymi jednymi plackami co znalazłam na drodze, one nie są dobre. Ale za to inne placki już są przeeepyszne! Mogła bym mówić o plackach caaały dzień. Ale są sprawy ważne i są placki, niestety teraz zajmę się sprawami ważnymi... Jak chodziłam po klatce schodowej poszukując placków, to niestety zauważyłam dużego pająka, który mnie przeraził, stoi przy tej pile mechanicznej, która nie jest zabezpieczona i dzieci z łatwością mogą się do niej dostać. Proszę, pozbądźcie się pająka, on nawet nie płąci ręty 😪'
						}
						footer={
							<div>
								<Tag
									text="Placki"
									emoji="🥞"
									backgroundColor={'var(--green)'}
								/>
								<Tag text="Skarga" emoji="💢" />
							</div>
						}
					/>
					<Publication
						date="04/05/2021"
						user="Marek"
						title={'Koszenie trawy'}
						body={
							'Szybki zarobek za skoszenie trawnika. Zapłacę 1zł za każdy metr kwadratowy. Koszenie trawnika w okolicy ul. Kolejowej 12. Zainteresowanych proszę o kontakt.'
						}
						footer={
							<div>
								<Tag text="Money" emoji="💸" backgroundColor={'var(--green)'} />
							</div>
						}
					/>
					<Publication
						date="05/05/2021"
						user="Boby Drop Tables"
						title={'To trzeba zmienić!'}
						body={
							'Dzisiaj będąc w kawiarni zapomniałem wziąść ze sobą telefonu, który miałem na stoliku. Gdy przyszedłem następnego dnia, obsługa nie chciała mi go oddać, choć na moich oczach tego ranka jak wchodziłem to go zabierali sprzątając! 😡😡'
						}
						footer={
							<div>
								<Tag text="Zgubione" emoji="🕸" />
								<Tag text="Skarga" emoji="💢" />
								<Tag
									text="Kawusia"
									emoji="☕"
									backgroundColor={'var(--blue)'}
								/>
							</div>
						}
					/>
					<Publication
						date="04/05/2021"
						user="Anna Marlena Wołoszyn III"
						title={'Plaaacki 🤤🤤🤤'}
						body={
							'Aaaa, ja bardzo lubię placki! Mają bardzo dobrą konsystencję, wszystkie placki są dobre, poza tymi jednymi plackami co znalazłam na drodze, one nie są dobre. Ale za to inne placki już są przeeepyszne! Mogła bym mówić o plackach caaały dzień. Ale są sprawy ważne i są placki, niestety teraz zajmę się sprawami ważnymi... Jak chodziłam po klatce schodowej poszukując placków, to niestety zauważyłam dużego pająka, który mnie przeraził, stoi przy tej pile mechanicznej, która nie jest zabezpieczona i dzieci z łatwością mogą się do niej dostać. Proszę, pozbądźcie się pająka, on nawet nie płąci ręty 😪'
						}
						footer={
							<div>
								<Tag
									text="Placki"
									emoji="🥞"
									backgroundColor={'var(--green)'}
								/>
								<Tag text="Skarga" emoji="💢" />
							</div>
						}
					/>
					<Publication
						date="04/05/2021"
						user="Marek"
						title={'Koszenie trawy'}
						body={
							'Szybki zarobek za skoszenie trawnika. Zapłacę 1zł za każdy metr kwadratowy. Koszenie trawnika w okolicy ul. Kolejowej 12. Zainteresowanych proszę o kontakt.'
						}
						footer={
							<div>
								<Tag text="Money" emoji="💸" backgroundColor={'var(--green)'} />
							</div>
						}
					/>
				</div>
				<div className={style.additionalElements}>
					<Calendar
						readOnly={true}
						value={[
							new Date(2022, 9, 14),
							new Date(2022, 9, 5),
							new Date(2022, 9, 10),
						]}
						plugins={[<DatePanel removeButton={false} />]}
					></Calendar>
				</div>
			</main>
		</div>
	);
};
export default MainPage;
