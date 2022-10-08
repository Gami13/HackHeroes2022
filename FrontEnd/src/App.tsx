import React, { useEffect, useState } from 'react';
import { createRoot } from 'react-dom/client';

import RegisterForm from './Components/RegisterForm/RegisterForm';
import { StrictMode } from 'react';
import './css.css';
import AppStates from './Components/States/States';
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';

const App = () => {
	const [isLoggedIn, setIsLoggedIn] = useState(false);
	const [userEmail, setUserEmail] = useState('');
	const [userID, setUserID] = useState('');
	const [userUsername, setUserUsername] = useState('');
	const [userToken, setUserToken] = useState('');

	const [isAdmin, setIsAdmin] = useState(false);

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
					<Routes>
						<Route
							path="/verify/:validationToken"
							element={<h1>walidacja</h1>}
						/>
						<Route path="/register" element={<RegisterForm />} />
						<Route path="/login" element={<h1>login</h1>} />
						<Route path="/" element={<h1 className="bg-Gray-50">nope</h1>} />
					</Routes>
				</BrowserRouter>
			</AppStates.Provider>
		</StrictMode>
	);
};

const root = createRoot(document.getElementById('root')!);
root.render(<App />);
