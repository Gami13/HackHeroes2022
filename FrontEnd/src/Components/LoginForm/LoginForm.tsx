import { useState } from 'react';
import { Link } from 'react-router-dom';
import FormInput from '../FormInput/FormInput';
import style from './LoginForm.module.css';
const LoginForm = () => {
	const [email, setEmail] = useState('');
	const [password, setPassword] = useState('');
	return (
		<div className={style.container}>
			<form
				className={style.loginForm}
				onSubmit={(e) => {
					e.preventDefault();
					// TODO loginUser();
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
				<button type="submit">Zaloguj</button>
				<Link to="/register">Nie masz konta?</Link>
			</form>
		</div>
	);
};
export default LoginForm;
