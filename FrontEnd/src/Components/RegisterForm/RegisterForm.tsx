import { SetStateAction, useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import style from './RegisterForm.module.css';
import RegisterCard from './../RegisterCard/RegisterCard';
import FormInput from '../FormInput/FormInput';
import Form from '../Main/Form/Form';
import Button from '../Main/Button/Button';
import PopUp from '../Main/PopUp/PopUp';

const RegisterForm = () => {
	const [firstName, setFirstName] = useState('');
	const [lastName, setLastName] = useState('');

	const [email, setEmail] = useState('');
	const [password, setPassword] = useState('');
	const [passwordConfirm, setPasswordConfirm] = useState('');
	const [firstNameErrors, setFirstNameErrors] = useState<string[]>([]);
	const [lastNameErrors, setLastNameErrors] = useState<string[]>([]);
	const [emailErrors, setEmailError] = useState<string[]>([]);
	const [passwordErrors, setPasswordErrors] = useState<string[]>([]);
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
			setPasswordErrors((oldArray: string[]) => [
				...oldArray,
				'- Musi mieć od 8 do 64 znaków',
			]);
		}
		if (!/[0-9]/.test(password)) {
			setPasswordErrors((oldArray: string[]) => [
				...oldArray,
				'- Musi zawierać co najmniej jedną cyfrę',
			]);
		}
		if (!/[a-zA-Z]/.test(password)) {
			setPasswordErrors((oldArray: string[]) => [
				...oldArray,
				'- Musi zawierać co najmniej jedną literę',
			]);
		}
		if (password != passwordConfirm) {
			setPasswordErrors((oldArray: string[]) => [
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
			<Form
				gap={4}
				className={style.registerForm}
				onSubmit={(e) => {
					e.preventDefault();
					registerUser();
				}}
			>
				<h1>Stwórz konto</h1>

				<FormInput
					type="text"
					id="firstName"
					label="Imie"
					value={firstName}
					onChange={(e) => setFirstName(e.target.value)}
					onBlur={validateFirstName}
					errors={firstNameErrors[0]}
				/>
				<FormInput
					type="text"
					id="lastName"
					label="Nazwisko"
					value={lastName}
					onChange={(e) => setLastName(e.target.value)}
					onBlur={validateLastName}
					errors={lastNameErrors[0]}
				/>
				<FormInput
					id="email"
					type="email"
					label="E-Mail"
					value={email}
					onChange={(e) => setEmail(e.target.value)}
					onBlur={validateEmail}
					errors={emailErrors[0]}
				/>
				<FormInput
					id="password"
					type="password"
					label="Hasło"
					value={password}
					onChange={(e) => setPassword(e.target.value)}
					onBlur={validatePassword}
					errors={passwordErrors[0]}
				/>
				<FormInput
					id="passwordConfirm"
					type="password"
					label="Potwierdź hasło"
					value={passwordConfirm}
					onChange={(e) => setPasswordConfirm(e.target.value)}
					onBlur={validatePassword}
					errors={passwordErrors[0]}
				/>
				<Button type={'submit'}>Zarejestruj</Button>
				<Link to="/login">Masz już konto?</Link>
			</Form>

			<h1>{responseError}</h1>
		</div>
	);
};
export default RegisterForm;
