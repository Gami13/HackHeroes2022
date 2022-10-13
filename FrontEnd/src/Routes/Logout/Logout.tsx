import React from 'react';
import Cookies from 'js-cookie';
import { useNavigate } from 'react-router-dom';
import States from '../../Components/States';
import { getCookie } from '../../cookies';

const Logout = () => {
	const state = React.useContext(States);
	const navigate = useNavigate();
	async function logout() {
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

		const res = await fetch(`http://localhost:3000/logout`, config);
		const json = await res.json();
		state.setUserEmail('');
		state.setUserID('');
		state.setUserFirstName('');
		state.setUserLastName('');
		state.setUserRanks([]);
		state.setUserToken('');
		state.setIsLoggedIn(false);
		Cookies.remove('token');
		navigate('/');
	}
	return (
		<div>
			{'' + logout()}
			<h1>Wylogowywanie...</h1>
		</div>
	);
};
export default Logout;
