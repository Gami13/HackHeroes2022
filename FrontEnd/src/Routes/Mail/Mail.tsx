import { useEffect, useState, useContext } from 'react';
import { Link, useNavigate, useParams } from 'react-router-dom';
import layouts from '../../layouts.module.css';
import Button from '../../Components/Main/Button/Button';
import style from './Mail.module.css';
import PersonCard from '../../Components/PersonCard/PersonCard';
import Box from '../../Components/Main/Box/Box';
import Input from '../../Components/Main/Input/Input';
import States from '../../Components/States';
import useIsFirstRender from '../../isFirstRender';

const Mail = () => {
	const context = useContext(States);
	const [personImage, setPersonImage] = useState('');
	const [personName, setPersonName] = useState('');
	const [personPosition, setPersonPosition] = useState('');
	const [personDescription, setPersonDescription] = useState('');
	const [personVoivodeship, setpersonVoivodeship] = useState('');
	const [personCounty, setPersonCounty] = useState('');
	const [personTown, setPersonTown] = useState('');
	const [message, setMessage] = useState('');
	const isFirstRender = useIsFirstRender();
	const { id } = useParams();
	async function sendMessage() {
		const response = await fetch('http://localhost:3000/sendMessage', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				recipientId: id,
				message: message,
				email: context.userEmail,
				token: context.userToken,
				userId: context.userID,
			}),
		});
		const data = await response.json();
		console.log(data);
	}
	async function fetchPerson() {
		console.log('fetching person');
		const response = await fetch('http://localhost:3000/getUserData', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				id: id,
			}),
		});

		const data = await response.json();
		console.log(data);
		///TODO: fetch person data
		setPersonImage(data.photo);
		setPersonName(data.firstName + ' ' + data.lastName);
		setPersonPosition(data.tags);
		setPersonDescription(data.description);
		setpersonVoivodeship('Malopolska');
		setPersonCounty('Kraków');
		setPersonTown('Kraków');
	}
	if (isFirstRender) {
		fetchPerson();
	}
	/* TODO: Add day picker, add time picker, check if that time is available */

	return (
		<div className={style.mail}>
			<main className={style.mainWrapper}>
				<Box className={style.main} width="100%" height="100%">
					<h1>Twoje wiadomości z {personName}</h1>

					<ol className={style.messages}>
						<li data-from="me" className={style.message}>
							<span>Ty</span>

							<p>Siema</p>
						</li>
						<li data-from="other" className={style.message}>
							<span>{personName}</span>

							<p>Siema byczku</p>
						</li>
						<li data-from="me" className={style.message}>
							<span>Ty</span>

							<p>
								Lorem ipsum dolor sit, amet consectetur adipisicing elit.
								Corporis optio similique autem dicta tenetur incidunt, quo magni
								temporibus ratione nihil doloremque voluptas? Ullam non mollitia
								delectus, soluta voluptate quisquam! Sapiente.
							</p>
						</li>
						<li data-from="me" className={style.message}>
							<span>Ty</span>

							<p>
								Lorem ipsum dolor sit, amet consectetur adipisicing elit.
								Corporis optio similique autem dicta tenetur incidunt, quo magni
								temporibus ratione nihil doloremque voluptas? Ullam non mollitia
								delectus, soluta voluptate quisquam! Sapiente.
							</p>
						</li>
						<li data-from="me" className={style.message}>
							<span>Ty</span>

							<p>
								Lorem ipsum dolor sit, amet consectetur adipisicing elit.
								Corporis optio similique autem dicta tenetur incidunt, quo magni
								temporibus ratione nihil doloremque voluptas? Ullam non mollitia
								delectus, soluta voluptate quisquam! Sapiente.
							</p>
						</li>
						<li data-from="other" className={style.message}>
							<span>{personName}</span>

							<p>
								Lorem ipsum dolor sit, amet consectetur adipisicing elit.
								Corporis optio similique autem dicta tenetur incidunt, quo magni
								temporibus ratione nihil doloremque voluptas? Ullam non mollitia
								delectus, soluta voluptate quisquam! Sapiente.
							</p>
						</li>
						<li data-from="other" className={style.message}>
							<span>{personName}</span>

							<p>
								Lorem ipsum dolor sit, amet consectetur adipisicing elit.
								Corporis optio similique autem dicta tenetur incidunt, quo magni
								temporibus ratione nihil doloremque voluptas? Ullam non mollitia
								delectus, soluta voluptate quisquam! Sapiente.
							</p>
						</li>
						<li data-from="other" className={style.message}>
							<span>{personName}</span>

							<p>
								Lorem ipsum dolor sit, amet consectetur adipisicing elit.
								Corporis optio similique autem dicta tenetur incidunt, quo magni
								temporibus ratione nihil doloremque voluptas? Ullam non mollitia
								delectus, soluta voluptate quisquam! Sapiente.
							</p>
						</li>
						<li data-from="other" className={style.message}>
							<span>{personName}</span>

							<p>
								Lorem ipsum dolor sit, amet consectetur adipisicing elit.
								Corporis optio similique autem dicta tenetur incidunt, quo magni
								temporibus ratione nihil doloremque voluptas? Ullam non mollitia
								delectus, soluta voluptate quisquam! Sapiente.
							</p>
						</li>
					</ol>
					<div className={style.input}>
						<Input onChange={(e) => setMessage(e.target.value)} type="text" />
						<Button onClick={() => sendMessage()}>
							<svg viewBox="0 0 24 24">
								<path d="M5.521,19.9h5.322l3.519,3.515a2.035,2.035,0,0,0,1.443.6,2.1,2.1,0,0,0,.523-.067,2.026,2.026,0,0,0,1.454-1.414L23.989,1.425Z" />
								<path d="M4.087,18.5,22.572.012,1.478,6.233a2.048,2.048,0,0,0-.886,3.42l3.495,3.492Z" />
							</svg>
						</Button>
					</div>
				</Box>
			</main>
			<aside className={style.person}>
				<PersonCard
					image={personImage}
					name={personName}
					position={personPosition}
					description={personDescription}
					voivodeship={personVoivodeship}
					county={personCounty}
					town={personTown}
					id={5834527345}
					noButtons={true}
				/>
			</aside>
		</div>
	);
};
export default Mail;
