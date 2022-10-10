import { SetStateAction, useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import style from './RegisterForm.module.css';
import RegisterCard from './../RegisterCard/RegisterCard';

const RegisterForm = () => {
	const [firstName, setFirstName] = useState('');
	const [lastName, setLastName] = useState('');

	const [email, setEmail] = useState('');
	const [password, setPassword] = useState('');
	const [passwordConfirm, setPasswordConfirm] = useState('');
	const [firstNameErrors, setFirstNameErrors] = useState<string[]>([]);
	const [lastNameErrors, setLastNameErrors] = useState<string[]>([]);
	const [emailErrors, setEmailError] = useState<string[]>([]);
	const [passwordErrors, setPasswordErrors] = useState<String[]>([]);
	const [responseError, setResponseError] = useState('');
	const [didRegister, setDidRegister] = useState(false);
	const navigate = useNavigate();

	useEffect(() => {
		if (didRegister) {
			//TODO: redirect to login
		}
	}, [didRegister]);

	function validateFirstName() {
		setFirstNameErrors([]);
		setFirstName(firstName.trim());
		if (firstName.length < 1) {
			setFirstNameErrors((oldArray: string[]) => [
				...oldArray,
				'- Imie nie może być puste',
			]);
		}
	}
	function validateLastName() {
		setLastNameErrors([]);
		setLastName(lastName.trim());
		if (lastName.length < 1) {
			setLastNameErrors((oldArray: string[]) => [
				...oldArray,
				'- Nazwisko nie może być puste',
			]);
		}
	}
	function validateEmail() {
		setEmail(email.trim());
		setEmailError([]);
		if (email.length < 3) {
			setEmailError((oldArray: string[]) => [
				...oldArray,
				'- Musi mieć więcej niż 3 znaki',
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
		setPasswordErrors([]);
		if (password.length < 8 || password.length > 64) {
			setPasswordErrors((oldArray: String[]) => [
				...oldArray,
				'- Musi mieć od 8 do 64 znaków',
			]);
		}
		if (!/[0-9]/.test(password)) {
			setPasswordErrors((oldArray: String[]) => [
				...oldArray,
				'- Musi zawierać co najmniej jedną cyfrę',
			]);
		}
		if (!/[a-zA-Z]/.test(password)) {
			setPasswordErrors((oldArray: String[]) => [
				...oldArray,
				'- Musi zawierać co najmniej jedną literę',
			]);
		}
		if (password != passwordConfirm) {
			setPasswordErrors((oldArray: String[]) => [
				...oldArray,
				'- Hasła nie są takie same',
			]);
		}
	}

	async function registerUser() {
		validateFirstName();
		validateLastName();
		validateEmail();
		validatePassword();

		if (
			firstNameErrors.length != 0 &&
			lastNameErrors.length != 0 &&
			emailErrors.length != 0 &&
			passwordErrors.length != 0
		) {
			console.log('Errors in form');
			return false;
		}

		let data = {
			firstName: firstName,
			lastName: lastName,
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
		<div className={style.container}>
			<RegisterCard
				firstName={firstName}
				lastName={lastName}
				email={email}
			></RegisterCard>
			<form
				className={style.registerForm}
				onSubmit={(e) => {
					e.preventDefault();
					registerUser();
				}}
			>
				<h1 className="text-text text-center text-2xl font-bold">
					Stwórz konto
				</h1>

				<label htmlFor="firstName">
					<div className="flex gap-2">
						<span className="font-bold text-text flex items-center">Imie</span>
						<span className="text-rred">{firstNameErrors[0]}</span>
					</div>

					<input
						type="text"
						id="firstName"
						value={firstName}
						onChange={(e) => setFirstName(e.target.value)}
						onBlur={validateFirstName}
					/>
				</label>
				<label htmlFor="lastName">
					<div className="flex gap-2">
						<span className="font-bold text-text flex items-center">
							Nazwisko
						</span>
						<span className="text-rred">{lastNameErrors[0]}</span>
					</div>

					<input
						type="text"
						id="lastName"
						value={lastName}
						onChange={(e) => setLastName(e.target.value)}
						onBlur={validateLastName}
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
						value={email}
						onChange={(e) => setEmail(e.target.value)}
						onBlur={validateEmail}
					/>
				</label>

				<label htmlFor="password">
					<div className="flex gap-2">
						<span className="font-bold text-text flex items-center">Hasło</span>
						<span className="text-rred">{passwordErrors[0]}</span>
					</div>
					<input
						type="password"
						id="password"
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
						value={passwordConfirm}
						onChange={(e) => setPasswordConfirm(e.target.value)}
						onBlur={validatePassword}
					/>
				</label>

				<button type="submit">Zarejestruj</button>
				<Link to="/login">Masz już konto?</Link>
			</form>

			<h1>{responseError}</h1>
		</div>
	);
};
export default RegisterForm;
