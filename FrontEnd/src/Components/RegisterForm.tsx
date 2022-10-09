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
				'- Nie może zawierać znaku #',
			]);
		}
		if (username.length < 3 || username.length > 32) {
			setUsernameError((oldArray: string[]) => [
				...oldArray,
				'- Musi być dłuższy niż 3 znaki i krótszy niż 32',
			]);
		}
	}
	function validateEmail() {
		setEmailError([]);
		if (email.length < 3) {
			setEmailError((oldArray: string[]) => [
				...oldArray,
				'- Musi być dłuższy niż 3 znaki',
			]);
		}

		if (!email.includes('@')) {
			setEmailError((oldArray: string[]) => [
				...oldArray,
				'- Musi być w odpowiednim formacie',
			]);
		}
	}
	function validatePassword() {
		setPasswordError([]);
		if (password.length < 8 || username.length > 64) {
			setPasswordError((oldArray: string[]) => [
				...oldArray,
				'- Musi być dłuższe niż 8 znaków i krótsze niż 64',
			]);
		}
		if (!/[0-9]/.test(password)) {
			setPasswordError((oldArray: string[]) => [
				...oldArray,
				'- Musi zawierać co najmniej jedną cyfrę',
			]);
		}
		if (!/[a-zA-Z]/.test(password)) {
			setPasswordError((oldArray: string[]) => [
				...oldArray,
				'- Musi zawierać co najmniej jedną literę',
			]);
		}
		if (password != passwordConfirm) {
			setPasswordError((oldArray: string[]) => [
				...oldArray,
				'- Hasła nie są takie same',
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
		<div className=" w-full h-full bg-depth2">
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
					className="
					bg-depth0 
					border-4
					border-accent 
					text-blue-200 
					rounded-xl
					shadow-xl 
					p-10
					flex 
					flex-col 
					gap-3
					justify-center 
					items-left 
					w-116"
					onSubmit={(e) => {
						e.preventDefault();
						registerUser();
					}}
				>
					<h1 className="text-text text-center text-2xl font-bold">
						Stwórz konto
					</h1>

					<label htmlFor="username">
						<div className="flex gap-2">
							<span className="font-bold text-text flex items-center">
								Nazwa
							</span>
							<span className="text-rred">{usernameErrors[0]}</span>
						</div>

						<input
							type="text"
							id="username"
							className="bg-depth2 border-2 w-full rounded-sm border-accent py-1.25 px-2 focus:outline-none focus:border-text"
							value={username}
							onChange={(e) => setUsername(e.target.value)}
							onBlur={validateUsername}
						/>
					</label>
					<label htmlFor="email">
						<div className="flex gap-2">
							<span className="font-bold text-text flex items-center">
								E-Mail
							</span>
							<span className="text-rred">{emailErrors[0]}</span>
						</div>
						<input
							type="email"
							id="email"
							className="bg-depth2 border-2  w-full rounded-sm border-accent py-1.25 px-2 focus:outline-none focus:border-text"
							value={email}
							onChange={(e) => setEmail(e.target.value)}
							onBlur={validateEmail}
						/>
					</label>

					<label htmlFor="password">
						<div className="flex gap-2">
							<span className="font-bold text-text flex items-center">
								Hasło
							</span>
							<span className="text-rred">{passwordErrors[0]}</span>
						</div>
						<input
							type="password"
							id="password"
							className="bg-depth2 border-2  w-full rounded-sm border-accent py-1.25 px-2 focus:outline-none focus:border-text"
							value={password}
							onChange={(e) => setPassword(e.target.value)}
							onBlur={validatePassword}
						/>
					</label>
					<label htmlFor="passwordConfirm">
						<div>
							<span className="text-text font-bold">Potwierdź hasło</span>
						</div>
						<input
							type="password"
							id="passwordConfirm"
							className="bg-depth2 border-2 w-full rounded-sm border-accent py-1.25 px-2 focus:outline-none focus:border-text"
							value={passwordConfirm}
							onChange={(e) => setPasswordConfirm(e.target.value)}
							onBlur={validatePassword}
						/>
					</label>

					<button
						type="submit"
						className="w-fit text-text bg-depth2 border-2 px-3 py-2 rounded-md border-accent m-auto font-bold"
					>
						Zarejestruj
					</button>
					<Link
						to="/login"
						className="underline hover:decoration-textGold w-fit"
					>
						Masz już konto?
					</Link>
				</form>

				<h1>{responseError}</h1>
			</div>
		</div>
	);
};
export default RegisterForm;
