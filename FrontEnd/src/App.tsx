import React, { useEffect, useState } from 'react';
import { createRoot } from 'react-dom/client';

import RegisterForm from './Components/RegisterForm/RegisterForm';
import { StrictMode } from 'react';
import './css.css';
import AppStates from './Components/States';
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import Navbar from './Components/Navbar/Navbar';
import style from './App.module.css';

const App = () => {
	const [isLoggedIn, setIsLoggedIn] = useState(false);
	const [userEmail, setUserEmail] = useState('');
	const [userID, setUserID] = useState('');
	const [userUsername, setUserUsername] = useState('');
	const [userToken, setUserToken] = useState('');

	const [isAdmin, setIsAdmin] = useState(false);
	const [isNavbarShown, setIsNavbarShown] = useState(false);

	useEffect(() => {}, [isLoggedIn]);

	return (
		<StrictMode>
			<AppStates.Provider
				value={{
					isLoggedIn,
					setIsLoggedIn,
					userEmail,
					setUserEmail,
					userID,
					setUserID,
					userUsername,
					setUserUsername,
					userToken,
					setUserToken,
					isAdmin,
					setIsAdmin,
				}}
			>
				<BrowserRouter>
					<Navbar></Navbar>
					<div className={style.navbarPadder}></div>
					<div className={style.routes}>
						<Routes>
							<Route
								path="/verify/:validationToken"
								element={<h1>walidacja</h1>}
							/>
							<Route path="/register" element={<RegisterForm />} />
							<Route path="/login" element={<h1>login</h1>} />
							<Route
								path="/"
								element={<h1 className="text-orange-600">nope</h1>}
							/>
						</Routes>
					</div>
				</BrowserRouter>
			</AppStates.Provider>
		</StrictMode>
	);
};

const root = createRoot(document.getElementById('root')!);
root.render(<App />);
