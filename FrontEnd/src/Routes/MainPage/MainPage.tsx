import { useContext, useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import style from './MainPage.module.css';
import States from '../../Components/States';

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
		</div>
	);
};
export default MainPage;
