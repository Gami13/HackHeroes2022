import { useContext, useEffect, useState } from 'react';
import style from './MainPage.module.css';
import States from '../../Components/States';
import Publication from '../../Components/Publication/Publication';
import Tag from '../../Components/Main/Tag/Tag';
import { Calendar } from 'react-multi-date-picker';
const MainPage = () => {
	const context = useContext(States);
	return (
		<div className={style.mainPage}>
			<h1>Cześć</h1>
			<p>
				{context.isLoggedIn}, {context.userEmail}, {context.userFirstName},{' '}
				{context.userFirstName},{context.userEmail}, {context.userID},
				{context.userRanks}
			</p>

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
						<Tag text="Kawusia" emoji="☕" color={'var(--blue)'} />
					</div>
				}
			/>
			<Calendar
				readOnly={true}
				multiple={true}
				value={[
					new Date(2022, 9, 14),
					new Date(2022, 9, 5),
					new Date(2022, 9, 10),
				]}
			></Calendar>
		</div>
	);
};
export default MainPage;
