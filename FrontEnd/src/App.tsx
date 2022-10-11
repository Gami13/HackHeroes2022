import React, { useEffect, useState } from 'react';
import { createRoot } from 'react-dom/client';

import RegisterForm from './Routes/RegisterForm/RegisterForm';
import { StrictMode } from 'react';
import './css.css';
import States from './Components/States';
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import Navbar from './Components/Navbar/Navbar';
import style from './App.module.css';
import LoginForm from './Routes/LoginForm/LoginForm';
import ReminderSettings from './Routes/ReminderSettings/ReminderSettings';
import ActivateAccount from './Routes/ActivateAccount/ActivateAccount';
import MainPage from './Routes/MainPage/MainPage';

const App = () => {
	const [isLoggedIn, setIsLoggedIn] = useState(false);
	const [userEmail, setUserEmail] = useState('');
	const [userID, setUserID] = useState('');
	const [userFirstName, setUserFirstName] = useState('');
	const [userLastName, setUserLastName] = useState('');
	const [userToken, setUserToken] = useState('');

	const [userRanks, setUserRanks] = useState<string[]>([]);

	const [isNavbarShown, setIsNavbarShown] = useState(false);

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
					<div className={style.navbarPadder}></div>
					<div className={style.routes}>
						<Routes>
							<Route
								path="/verify/:validationToken"
								element={<ActivateAccount />}
							/>
							<Route path="/register" element={<RegisterForm />} />
							<Route path="/login" element={<LoginForm />} />
							<Route path="/" element={<MainPage />} />
							<Route path="/reminder" element={<ReminderSettings />} />
						</Routes>
					</div>
				</BrowserRouter>
			</States.Provider>
		</StrictMode>
	);
};

const root = createRoot(document.getElementById('root')!);
root.render(<App />);
