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
import Select from '../../Components/Main/Select/Select';
import useIsFirstRender from '../../isFirstRender';

interface tak {
	id: number;
	name: string;
}

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

	const [voivodeship, setVoivodeship] = useState<tak | undefined>();
	const [county, setCounty] = useState<tak | undefined>();
	const [town, setTown] = useState<tak | undefined>();
	const [voivodeshipList, setVoivodeshipList] = useState<tak[]>([]);
	const [countyList, setCountyList] = useState<tak[]>([]);
	const [townList, setTownList] = useState<tak[]>([]);
	const [dateOfBirth, setDateOfBirth] = useState(new Date());
	const [dateOfBirthErrors, setDateOfBirthErrors] = useState<string[]>([]);
	const [gender, setGender] = useState('?');
	const [genderErrors, setGenderErrors] = useState<string[]>([]);
	const [voivodeshipErrors, setVoivodeshipErrors] = useState<string[]>([]);
	const [countyErrors, setCountyErrors] = useState<string[]>([]);
	const [townErrors, setTownErrors] = useState<string[]>([]);
	const [isPreviewed, setIsPreviewed] = useState(false);
	const [displayOverlay, setDisplayOverlay] = useState(false);

	const [step, setStep] = useState(0);
	const context = useContext(States);

	const isFirstRender = useIsFirstRender();
	if (isFirstRender) {
		let w = async () => {
			let res = await fetch('http://localhost:3000/wojewodztwa');
			let json = await res.json();
			setVoivodeshipList(json.wojewodztwa);
		};
		w();
		console.log('first render');
	}

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

	async function fetchCounties() {
		console.log('fetching counties');
		if (!voivodeship) return;
		const res = await fetch(`http://localhost:3000/powiaty/${voivodeship.id}`);
		const json = await res.json();
		if (json.powiaty) setCountyList(json.powiaty);
	}
	async function fetchTowns() {
		console.log('fetching towns');
		if (!county) return;
		const res = await fetch(`http://localhost:3000/gminy/${county.id}`);
		const json = await res.json();
		if (json.gminy) setTownList(json.gminy);
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
		}
		//check if date is 13 years ago from now
		if (dateOfBirth.getFullYear() > currentDate.getFullYear() - 13) {
			setDateOfBirthErrors((oldArray: string[]) => [
				...oldArray,
				'- Musisz mieć przynajmniej 13 lat',
			]);
			return false;
		}

		return true;
	}
	function validateGender() {
		setGenderErrors([]);
		if (gender == 'M' || gender == 'K' || gender == '👽') {
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
		if (!voivodeship) {
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
		if (!county) {
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
		if (!town) {
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
			!validateEmail() &&
			!validatePassword() &&
			!validatePersonalData() &&
			!validateLocalizationData() &&
			!validateVoivodeship() &&
			!validateCounty() &&
			!validateTown()
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
			dateOfBirth: dateOfBirth,
			gender: gender,
			voivodeship: voivodeship,
			county: county,
			town: town,
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
	return (
		<div className={[layouts.center].flat().join(' ')}>
			<Form
				padding="1rem"
				className={style.registerForm}
				onSubmit={(e) => {
					e.preventDefault();
					registerUser();
				}}
				id="registerForm"
			>
				<i
					onClick={() => {
						setIsPreviewed(!isPreviewed);
						setDisplayOverlay(true);
					}}
					className={style.previewCard}
				>
					<svg height="40" width="48">
						<path d="M24 31.5q3.55 0 6.025-2.475Q32.5 26.55 32.5 23q0-3.55-2.475-6.025Q27.55 14.5 24 14.5q-3.55 0-6.025 2.475Q15.5 19.45 15.5 23q0 3.55 2.475 6.025Q20.45 31.5 24 31.5Zm0-3.7q-2 0-3.4-1.4T19.2 23q0-2 1.4-3.4t3.4-1.4q2 0 3.4 1.4t1.4 3.4q0 2-1.4 3.4T24 27.8Zm0 11.35q-7.7 0-13.9-4.5T.85 23q3.05-7.15 9.25-11.65T24 6.85q7.7 0 13.9 4.5T47.15 23q-3.05 7.15-9.25 11.65T24 39.15ZM24 23Zm0 12q6 0 11.05-3.275Q40.1 28.45 42.75 23q-2.65-5.45-7.675-8.725Q30.05 11 24 11q-6 0-11.05 3.275Q7.9 17.55 5.2 23q2.7 5.45 7.725 8.725Q17.95 35 24 35Z" />
					</svg>
				</i>

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
									validateDateOfBirth();
								}}
							></DatePicker>
						</Label>
						<Label className={style.gender} htmlFor="gender" label="Płeć">
							<span className={style.error}>{genderErrors}</span>
							<Select
								options={[
									{ title: 'Kobieta', value: 'K' },
									{ title: 'Mężczyzna', value: 'M' },
									{ title: '👽 Starożytny kosmita 👽', value: '👽' },
								]}
								startValue="Wybierz płeć"
								onBlur={validateGender}
								onChange={(e) => {
									setGender(e.target.value);
								}}
								name="gender"
								id="gender"
								placeholder="Wybierz płeć"
								value={gender}
							/>
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
							data={voivodeshipList.map((c) => c.name)}
							title="Województwo"
							id="wojewodztwa"
							onChange={(e) =>
								setVoivodeship(
									voivodeshipList?.find((v) => v.name == e.target.value)
								)
							}
							onBlur={fetchCounties}
						/>
						<DataList
							errors={countyErrors}
							title="Powiat"
							id="powiat"
							data={countyList.map((c) => c.name)}
							onChange={(e) =>
								setCounty(countyList?.find((c) => c.name == e.target.value))
							}
							disabled={!voivodeship}
							onBlur={fetchTowns}
						/>
						<DataList
							errors={townErrors}
							title="Gmina"
							id="gmina"
							data={townList.map((c) => c.name)}
							onChange={(e) =>
								setTown(townList?.find((c) => c.name == e.target.value))
							}
							disabled={!county}
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

			<div
				className={`${
					displayOverlay ? style.registerCardOverlay : style.closeOverlay
				}`}
				onClick={() => {
					setIsPreviewed(!isPreviewed);
					setDisplayOverlay(false);
				}}
			>
				<h1>Click again to close preview.</h1>
				<RegisterCard
					firstName={firstName}
					lastName={lastName}
					email={email}
					dateOfBirth={dateOfBirth}
					gender={gender}
					voivodeship={voivodeship?.name || ''}
					county={county?.name || ''}
					town={town?.name || ''}
					isPreviewed={isPreviewed}
				></RegisterCard>
			</div>

			{/* <h1>{responseError}</h1> */}
		</div>
	);
};
export default RegisterForm;
