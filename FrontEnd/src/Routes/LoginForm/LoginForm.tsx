import { useState, useEffect, useContext } from 'react';
import { Link } from 'react-router-dom';
import FormInput from '../../Components/FormInput/FormInput';
import Form from '../../Components/Main/Form/Form';
import Button from '../../Components/Main/Button/Button';
import CheckBox from '../../Components/Main/CheckBox/CheckBox';
import style from './LoginForm.module.css';
import States from '../../Components/States';

import layouts from '../../layouts.module.css';

const LoginForm = () => {
	const [email, setEmail] = useState('');
	const [password, setPassword] = useState('');
	const [rememberMe, setRememberMe] = useState(false);
	const [error, setResponseError] = useState('');
	const [didLogin, setDidLogin] = useState(false);
	const context = useContext(States);

	async function loginUser() {
		let data = {
			email: email,
			password: password,
		};
		let config = {
			method: 'POST',
			headers: {
				Accept: 'application/json',
				'Content-Type': 'application/json',
				credentials: 'include',
			},
			body: JSON.stringify(data),
		};

		const res = await fetch(`http://localhost:3000/login`, config);
		const json = await res.json();
		console.log(json);
		if (json.status == 'success') {
			context.setIsLoggedIn(true);
			context.setUserEmail(json.email);
			context.setUserFirstName(json.firstName);
			context.setUserLastName(json.lastName);
			context.setUserID(json.id);
			context.setUserToken(json.token);
			context.setUserRanks(json.ranks);

			localStorage.setItem('isLoggedIn', context.isLoggedIn.toString());
			localStorage.setItem('userEmail', context.userEmail);
			localStorage.setItem('userFirstName', context.userFirstName);
			localStorage.setItem('userLastName', context.userLastName);
			localStorage.setItem('userID', context.userID);
			localStorage.setItem('userToken', context.userToken);
			localStorage.setItem('userRanks', JSON.stringify(context.userRanks));

			setDidLogin(true);
			console.log('login successful');
		} else {
			setResponseError(json.message);
		}
	}
	useEffect(() => {
		if (didLogin) {
			/* TODO: NAVIGATE TO SOMEWHERE */
			console.log('logged in');
		}
	}, [didLogin]);
	return (
		<div className={layouts.center}>
			<Form
				className={style.loginForm}
				onSubmit={(e) => {
					e.preventDefault();
					loginUser();
				}}
			>
				<h1>Zaloguj się</h1>

				<FormInput
					id="email"
					type="email"
					label="E-Mail"
					value={email}
					onChange={(e) => setEmail(e.target.value)}
					// onBlur={validateEmail}
					// errors={emailErrors}
				/>
				<FormInput
					id="password"
					type="password"
					label="Hasło"
					value={password}
					onChange={(e) => setPassword(e.target.value)}
					// onBlur={validatePassword}
					// errors={passwordErrors}
				/>
				<CheckBox></CheckBox>
				<Button type="submit">Zaloguj</Button>
				<Link to="/register">Nie masz konta?</Link>
			</Form>
		</div>
	);
};
export default LoginForm;
