import { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';

const RegisterForm = () => {
	const [username, setUsername] = useState('');
	const [email, setEmail] = useState('');
	const [password, setPassword] = useState('');
	const [passwordConfirm, setPasswordConfirm] = useState('');
	const [usernameErrors, setUsernameError] = useState<any>([]);
	const [emailErrors, setEmailError] = useState<any>([]);
	const [passwordErrors, setPasswordError] = useState<any>([]);
	const [responseError, setResponseError] = useState('');
	const [didRegister, setDidRegister] = useState(false);
	const navigate = useNavigate();

	const [cardName, setCardName] = useState('');
	const [cardEmail, setCardEmail] = useState('');

	useEffect(() => {
		switch (email.length) {
			case 0:
				setCardEmail('####');
				break;
			case 1:
				setCardEmail(email + '###');
				break;
			case 2:
				setCardEmail(email + '##');
				break;
			case 3:
				setCardEmail(email + '#');
				break;
			default:
				setCardEmail(email);
				break;
		}
	}, [email]);
	useEffect(() => {
		//find part after @

		const x = cardEmail.split('@')[0];

		const splitEmail = x.match(/.{1,16}/g);
		if (splitEmail) {
			setCardEmail(splitEmail.join('\n'));
		}
	}, [cardEmail]);

	useEffect(() => {
		switch (username.length) {
			case 0:
				setCardName('####');
				break;
			case 1:
				setCardName(username + '###');
				break;
			case 2:
				setCardName(username + '##');
				break;
			case 3:
				setCardName(username + '#');
				break;
			default:
				setCardName(username);
				break;
		}
	}, [username]);
	useEffect(() => {
		const splitUsername = cardName.match(/.{1,16}/g);
		if (splitUsername) {
			setCardName(splitUsername.join('\n'));
		}
	}, [cardName]);

	useEffect(() => {
		if (didRegister) {
			//TODO: redirect to login
		}
	}, [didRegister]);
	function validateUsername() {
		setUsernameError([]);
		if (username.includes('#')) {
			setUsernameError((oldArray: string[]) => [
				...oldArray,
				"- Can't contain #",
			]);
		}
		if (username.length < 3 || username.length > 32) {
			setUsernameError((oldArray: string[]) => [
				...oldArray,
				'- Must be between 3 and 32 characters',
			]);
		}
	}
	function validateEmail() {
		setEmailError([]);
		if (email.length < 3) {
			setEmailError((oldArray: string[]) => [
				...oldArray,
				'- Must be at least 3 characters long',
			]);
		}

		if (!email.includes('@')) {
			setEmailError((oldArray: string[]) => [
				...oldArray,
				'- Must be in the correct format',
			]);
		}
	}
	function validatePassword() {
		setPasswordError([]);
		if (password.length < 8 || username.length > 64) {
			setPasswordError((oldArray: string[]) => [
				...oldArray,
				'- Must be between 8 and 64 characters',
			]);
		}
		if (!/[0-9]/.test(password)) {
			setPasswordError((oldArray: string[]) => [
				...oldArray,
				'- Must contain at least one number',
			]);
		}
		if (!/[a-zA-Z]/.test(password)) {
			setPasswordError((oldArray: string[]) => [
				...oldArray,
				'- Must contain at least one letter',
			]);
		}
		if (password != passwordConfirm) {
			setPasswordError((oldArray: string[]) => [
				...oldArray,
				'Passwords must match',
			]);
		}
	}

	async function registerUser() {
		validateUsername();
		validateEmail();
		validatePassword();

		if (
			usernameErrors.length != 0 &&
			emailErrors.length != 0 &&
			passwordErrors.length != 0
		) {
			console.log('Errors in form');
			return false;
		}

		let data = {
			username: username,
			email: email,
			password: password,
			passwordConfirm: passwordConfirm,
		};
		let config = {
			method: 'POST',
			headers: {
				Accept: 'application/json',
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(data),
		};

		const res = await fetch(`http://localhost:3000/registerUser`, config);
		const json = await res.json();
		console.log(json);
		if (json.status == 'success') {
			setDidRegister(true);
		} else {
			setResponseError(json.message);
		}
	}

	return (
		<div>
			<div>
				<div>
					<div>
						<div>
							{' '}
							<span>Name:</span>
							<p>{cardName}</p>
						</div>
						<div>
							<span>E-Mail:</span>
							<p>{cardEmail}</p>
						</div>
					</div>
				</div>

				<form
					onSubmit={(e) => {
						e.preventDefault();
						registerUser();
					}}
				>
					<h1>Stwórz konto</h1>

					<label htmlFor="username">
						<span>Nazwa</span>
						<span>{usernameErrors[0]}</span>
						<input
							type="text"
							id="username"
							value={username}
							onChange={(e) => setUsername(e.target.value)}
							onBlur={validateUsername}
						/>
					</label>

					<label htmlFor="email">
						<span>E-Mail</span> <span>{emailErrors[0]}</span>
						<input
							type="email"
							id="email"
							value={email}
							onChange={(e) => setEmail(e.target.value)}
							onBlur={validateEmail}
						/>
					</label>

					<label htmlFor="password">
						<span>Hasło</span>
						<span>{passwordErrors[0]}</span>
						<input
							type="password"
							id="password"
							value={password}
							onChange={(e) => setPassword(e.target.value)}
							onBlur={validatePassword}
						/>
					</label>
					<label htmlFor="passwordConfirm">
						<span>Potwierdź hasło</span>
						<input
							type="password"
							id="passwordConfirm"
							value={passwordConfirm}
							onChange={(e) => setPasswordConfirm(e.target.value)}
							onBlur={validatePassword}
						/>
					</label>

					<button type="submit">Dalej</button>
					<Link to="/login">Masz już konto??</Link>
				</form>

				<h1>{responseError}</h1>
			</div>
		</div>
	);
};
export default RegisterForm;
