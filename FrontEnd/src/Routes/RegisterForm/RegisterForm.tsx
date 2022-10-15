import { useEffect, useContext, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import States from '../../Components/States';
import style from './RegisterForm.module.css';
import RegisterCard from '../../Components/RegisterCard/RegisterCard';
import FormInput from '../../Components/FormInput/FormInput';
import Form from '../../Components/Main/Form/Form';
import Button from '../../Components/Main/Button/Button';
import PopUp from '../../Components/Main/PopUp/PopUp';
import Notification from '../../Components/Main/Notification/Notification';
import DataList from '../../Components/DataList/DataList';
import Label from '../../Components/Main/Label/Label';

import layouts from '../../layouts.module.css';
import DatePicker from '../../Components/Main/DatePicker/DatePicker';

const RegisterForm = () => {
	const [firstNameErrors, setFirstNameErrors] = useState<string[]>([]);
	const [lastNameErrors, setLastNameErrors] = useState<string[]>([]);
	const [firstName, setFirstName] = useState('');
	const [lastName, setLastName] = useState('');
	const [email, setEmail] = useState('');
	const [password, setPassword] = useState('');
	const [passwordConfirm, setPasswordConfirm] = useState('');

	const [emailErrors, setEmailError] = useState<string[]>([]);
	const [passwordErrors, setPasswordErrors] = useState<string[]>([]);
	const [responseError, setResponseError] = useState('');
	const [didRegister, setDidRegister] = useState(false);
	const navigate = useNavigate();

	const [voivodeship, setVoivodeship] = useState('');
	const [county, setCounty] = useState('');
	const [town, setTown] = useState('');
	const [countyList, setCountyList] = useState(['test', 'test2', 'test3']);
	const [townList, setTownList] = useState(['test4', 'test5', 'test6']);
	const [dateOfBirth, setDateOfBirth] = useState(new Date());
	const [dateOfBirthErrors, setDateOfBirthErrors] = useState<string[]>([]);
	const [gender, setGender] = useState('?');
	const [genderErrors, setGenderErrors] = useState<string[]>([]);
	const [voivodeshipErrors, setVoivodeshipErrors] = useState<string[]>([]);
	const [countyErrors, setCountyErrors] = useState<string[]>([]);
	const [townErrors, setTownErrors] = useState<string[]>([]);

	const [step, setStep] = useState(0);
	const context = useContext(States);

	function validateFirstName() {
		setFirstNameErrors([]);
		setFirstName(firstName.trim());
		if (firstName.length < 1) {
			setFirstNameErrors((oldArray: string[]) => [
				...oldArray,
				'- Imie nie może być puste',
			]);
			return false;
		}
		return true;
	}
	function validateLastName() {
		setLastNameErrors([]);
		setLastName(lastName.trim());
		if (lastName.length < 1) {
			setLastNameErrors((oldArray: string[]) => [
				...oldArray,
				'- Nazwisko nie może być puste',
			]);
			return false;
		}
		return true;
	}

	function fetchCounties() {
		/* TODO: Fetch counties */
	}
	function fetchTowns() {
		/* TODO: Fetch towns */
	}
	useEffect(() => {
		/* TODO: Fetch people */
	}, [voivodeship, county, town]);

	function validateEmail() {
		setEmail(email.trim());
		setEmailError([]);
		if (email.length < 3) {
			setEmailError((oldArray: string[]) => [
				...oldArray,
				'- Musi mieć więcej niż 3 znaki',
			]);
			return false;
		}

		if (!email.includes('@')) {
			setEmailError((oldArray: string[]) => [
				...oldArray,
				'- Musi być w odpowiednim formacie',
			]);
			return false;
		}
		return true;
	}
	function validatePassword() {
		setPasswordErrors([]);
		if (password.length < 8 || password.length > 64) {
			setPasswordErrors((oldArray: string[]) => [
				...oldArray,
				'- Musi mieć od 8 do 64 znaków',
			]);
			return false;
		}
		if (!/[0-9]/.test(password)) {
			setPasswordErrors((oldArray: string[]) => [
				...oldArray,
				'- Musi zawierać co najmniej jedną cyfrę',
			]);
			return false;
		}
		if (!/[a-zA-Z]/.test(password)) {
			setPasswordErrors((oldArray: string[]) => [
				...oldArray,
				'- Musi zawierać co najmniej jedną literę',
			]);
			return false;
		}
		if (password != passwordConfirm) {
			setPasswordErrors((oldArray: string[]) => [
				...oldArray,
				'- Hasła nie są takie same',
			]);
			return false;
		}
		return true;
	}

	function validateDateOfBirth() {
		setDateOfBirthErrors([]);
		let currentDate = new Date();
		if (dateOfBirth == null) {
			setDateOfBirthErrors((oldArray: string[]) => [
				...oldArray,
				'- Musisz podać datę urodzenia',
			]);
			return false;
		} else if (dateOfBirth.getTime() - currentDate.getTime() < 410240038000) {
		}
		return true;
	}
	function validateGender() {
		console.log('test');
		setGenderErrors([]);
		if (gender == '?' || gender == 'M' || gender == 'K') {
			return true;
		}
		setGenderErrors((oldArray: string[]) => [
			...oldArray,
			'- Musisz wybrać płeć',
		]);
		return false;
	}
	function validateVoivodeship() {
		setVoivodeshipErrors([]);
		if (voivodeship.length < 4) {
			setVoivodeshipErrors((oldArray: string[]) => [
				...oldArray,
				'- Musisz wybrać województwo',
			]);
			return false;
		}
		return true;
	}
	function validateCounty() {
		setCountyErrors([]);
		if (county.length < 4) {
			setCountyErrors((oldArray: string[]) => [
				...oldArray,
				'- Musisz wybrać powiat',
			]);
			return false;
		}
		return true;
	}
	function validateTown() {
		setTownErrors([]);
		if (town.length < 4) {
			setTownErrors((oldArray: string[]) => [
				...oldArray,
				'- Musisz wybrać gminę',
			]);
			return false;
		}
		return true;
	}
	function validateLocalizationData() {
		validateVoivodeship();
		validateCounty();
		validateTown();
		if (validateVoivodeship() && validateCounty() && validateTown()) {
			setStep(2);
			return true;
		}
		return false;
	}
	function validatePersonalData() {
		validateFirstName();
		validateLastName(); /* validate birthday */
		validateDateOfBirth();
		validateGender();
		if (
			validateLastName() &&
			validateFirstName() &&
			validateDateOfBirth() &&
			validateGender()
		) {
			setStep(1);
			return true;
		}
		return false;
	}
	async function registerUser() {
		validateEmail();
		validatePassword();

		if (
			validateEmail() &&
			validatePassword() &&
			validatePersonalData() &&
			validateLocalizationData()
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
			navigate('/plsVerify');
		} else {
			setResponseError(json.message);
		}
	}
	console.log('test');
	return (
		<div className={[layouts.center].join(' ')}>
			<Form
				padding="1rem"
				className={style.registerForm}
				onSubmit={(e) => {
					e.preventDefault();
					registerUser();
				}}
				id="registerForm"
			>
				<h1>Stwórz konto</h1>
				{step == 0 ? (
					<fieldset form="registerForm">
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
						<Label htmlFor="date" label="Data Urodzenia">
							<span className={style.error}>{dateOfBirthErrors[0]}</span>
							<DatePicker
								containerClassName={style.date}
								inputClassName={style.date}
								id="date"
								maxDate={new Date()}
								value={dateOfBirth}
								onChange={(date) => {
									setDateOfBirth(date?.toDate());
								}}
							></DatePicker>
						</Label>
						<Label className={style.gender} htmlFor="gender" label="Płeć">
							<span className={style.error}>{genderErrors}</span>
							<select
								onBlur={validateGender}
								onChange={(e) => {
									setGender(e.target.value);
								}}
								name="gender"
								id="gender"
								placeholder="Wybierz płeć"
								value={gender}
							>
								<option style={{ display: 'none' }} defaultValue="?">
									Wybierz płeć
								</option>
								<option value="K">Kobieta</option>
								<option value="M">Mężczyzna</option>
								<option value="👽">👽 Starożytny kosmita 👽</option>
							</select>
						</Label>

						<Button
							type="button"
							onClick={() => {
								validatePersonalData();
							}}
						>
							Dalej
						</Button>
					</fieldset>
				) : step == 1 ? (
					<fieldset className={style.dataList} form="registerForm">
						<DataList
							errors={voivodeshipErrors}
							title="Województwo"
							id="wojewodztwa"
							data={['Małopolska', 'Śląskie', 'Mazowieckie']}
							onChange={(e) => setVoivodeship(e.target.value)}
							onBlur={fetchCounties}
						/>
						<DataList
							errors={countyErrors}
							title="Powiat"
							id="powiat"
							data={countyList}
							onChange={(e) => setCounty(e.target.value)}
							disabled={voivodeship == ''}
							onBlur={fetchTowns}
						/>
						<DataList
							errors={townErrors}
							title="Gmina"
							id="gmina"
							data={townList}
							onChange={(e) => setTown(e.target.value)}
							disabled={county == ''}
						/>
						<Button
							type="button"
							onClick={() => {
								validateLocalizationData();
							}}
						>
							Dalej
						</Button>
					</fieldset>
				) : (
					<fieldset form="registerForm">
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
						/>
					</fieldset>
				)}

				<Link to="/login">Masz już konto?</Link>

				{step == 2 ? <Button type={'submit'}>Zarejestruj</Button> : null}
			</Form>

			<RegisterCard
				firstName={firstName}
				lastName={lastName}
				email={email}
				dateOfBirth={dateOfBirth}
				gender={gender}
				voivodeship={voivodeship}
				county={county}
				town={town}
			></RegisterCard>
			<Notification
				icon="success"
				title={'Rejestracja'}
				body={'Zarejestrowałeś się pomyślnie'}
				footer={'Zaloguj się'}
			></Notification>

			<h1>{responseError}</h1>
		</div>
	);
};
export default RegisterForm;
