import React, { useEffect, useState, StrictMode } from 'react';
import { createRoot } from 'react-dom/client';

import RegisterForm from './Routes/RegisterForm/RegisterForm';
import './css.css';
import States from './Components/States';
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import Navbar from './Components/Navbar/Navbar';
import style from './App.module.css';
import LoginForm from './Routes/LoginForm/LoginForm';
import ReminderSettings from './Routes/ReminderSettings/ReminderSettings';
import ActivateAccount from './Routes/ActivateAccount/ActivateAccount';
import MainPage from './Routes/MainPage/MainPage';
import useIsFirstRender from './isFirstRender';
import Test from './Routes/Test/Test';
import Logout from './Routes/Logout/Logout';
import PlsVerify from './Routes/PlsVerify/PlsVerify';
import { getCookie } from './cookies';
import BookMeeting from './Routes/BookMeeting/BookMeeting';
import Publication from './Routes/Publication/Publication';
import Mail from './Routes/Mail/Mail';

const App = () => {
	const [isLoggedIn, setIsLoggedIn] = useState(false);
	const [userEmail, setUserEmail] = useState('');
	const [userID, setUserID] = useState('');
	const [userFirstName, setUserFirstName] = useState('');
	const [userLastName, setUserLastName] = useState('');
	const [userToken, setUserToken] = useState('');

	const [userRanks, setUserRanks] = useState<string[]>([]);

	const isFirstRender = useIsFirstRender();

	if (isFirstRender) {
		let a = async () => {
			let cookie = getCookie('token');
			if (!cookie) {
				return;
			}

			let data = {
				id: cookie.id,
				email: cookie.email,

				token: cookie.token,
			};
			let config = {
				method: 'POST',
				headers: {
					Accept: 'application/json',
					'Content-Type': 'application/json',
				},
				body: JSON.stringify(data),
			};

			const res = await fetch(`http://localhost:3000/userData`, config);
			const json = await res.json();
			console.log(json);
			if (json.status == 'success') {
				setUserEmail(json.email);
				setUserID(cookie.id);
				setUserFirstName(json.firstName);
				setUserLastName(json.lastName);
				setUserRanks(json.ranks);
				setUserToken(cookie.token);
				setIsLoggedIn(true);
			}
		};

		a();
	}

	useEffect(() => {}, [isLoggedIn]);

	return (
		<StrictMode>
			<States.Provider
				value={{
					isLoggedIn,
					setIsLoggedIn,
					userEmail,
					setUserEmail,
					userID,
					setUserID,

					userFirstName,
					setUserFirstName,
					userLastName,
					setUserLastName,

					userToken,
					setUserToken,

					userRanks,
					setUserRanks,
				}}
			>
				<BrowserRouter>
					<Navbar></Navbar>
					<aside className={style.navbarPadder}></aside>
					<div className={style.routes}>
						<Routes>
							<Route path="/mail" element={<Mail />} />

							<Route path="/publication/:id" element={<Publication />} />
							<Route path="/verify/:token" element={<ActivateAccount />} />
							<Route path="/register" element={<RegisterForm />} />
							<Route path="/login" element={<LoginForm />} />
							<Route path="/" element={<MainPage />} />
							<Route path="/reminder" element={<ReminderSettings />} />
							<Route path="/test" element={<Test />} />
							<Route path="/plsVerify" element={<PlsVerify />} />
							<Route path="/logout" element={<Logout />} />
							<Route path="/bookMeeting" element={<BookMeeting />} />
						</Routes>
					</div>
				</BrowserRouter>
			</States.Provider>
		</StrictMode>
	);
};

const root = createRoot(document.getElementById('root')!);
root.render(<App />);
