import { useEffect, useState, useContext } from 'react';
import { Link, useNavigate, useParams } from 'react-router-dom';
import layouts from '../../layouts.module.css';
import Button from '../../Components/Main/Button/Button';
import style from './Mail.module.css';
import PersonCard from '../../Components/PersonCard/PersonCard';
import Box from '../../Components/Main/Box/Box';
import Tag from '../../Components/Main/Tag/Tag';
import Input from '../../Components/Main/Input/Input';
import States from '../../Components/States';
import useIsFirstRender from '../../isFirstRender';

const Mail = () => {
	const context = useContext(States);
	const [personImage, setPersonImage] = useState('');
	const [personName, setPersonName] = useState('');
	const [personRanks, setPersonRanks] = useState<any>();
	const [personDescription, setPersonDescription] = useState('');
	const [personVoivodeship, setpersonVoivodeship] = useState('');
	const [personCounty, setPersonCounty] = useState('');
	const [personTown, setPersonTown] = useState('');
	const [message, setMessage] = useState('');
	const [messagesDisplay, setMessagesDisplay] = useState<any>();
	const [alreadyFetchedMessages, setAlreadyFetchedMessages] = useState<any[]>(
		[]
	);
	const [messages, setMessages] = useState<any>([]);

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
		if (data.status == 'success') {
			setMessage('');
			fetchMessages(alreadyFetchedMessages);
		}
	}
	async function fetchMessages(alreadyFetched: string[]) {
		const response = await fetch('http://localhost:3000/getMessages', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				email: context.userEmail,
				token: context.userToken,
				userId: context.userID,
				otherPerson: id,
				alreadyFetched: alreadyFetched,
			}),
		});
		const data = await response.json();

		if (data.status == 'success') {
			setMessages([...data.results]);

			let test = data.results.map((e: any) => e.id);
			test = [...alreadyFetchedMessages, ...test];
			setAlreadyFetchedMessages(test);
		}
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
		if (data.status === 'error') {
			console.log(data.message);
		}

		setPersonImage('http://localhost:3000/userProfileImage/' + data.userId);

		setPersonName(data.firstName + ' ' + data.lastName);
		setPersonRanks(
			data.ranks.map((rank: any, index: number) => (
				<Tag text={rank.name} backgroundColor={rank.color} key={index} />
			))
		);
		setPersonDescription(data.description);
		setpersonVoivodeship(data.voivodeship);
		setPersonCounty(data.county);
		setPersonTown(data.town);
	}
	if (isFirstRender) {
		fetchPerson();
		fetchMessages(alreadyFetchedMessages);
		setInterval(() => {
			fetchMessages(alreadyFetchedMessages);
		}, 5000);
	}

	return (
		<div className={style.mail}>
			<main className={style.mainWrapper}>
				<Box className={style.main} width="100%" height="100%">
					<h1>Twoje wiadomości z {personName}</h1>
					<ol className={style.messages}>
						{messages
							? messages.map((message: any, index: number) =>
									message.senderId == id ? (
										<li data-from="other" className={style.message} key={index}>
											<span>{personName}</span>
											<p>{message.message}</p>
										</li>
									) : (
										<li data-from="me" className={style.message} key={index}>
											<span>Ty</span>
											<p>{message.message}</p>
										</li>
									)
							  )
							: null}
					</ol>

					<div className={style.input}>
						<Input
							onChange={(e) => setMessage(e.target.value)}
							type="text"
							value={message}
						/>
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
					position={personRanks}
					description={personDescription}
					voivodeship={personVoivodeship}
					county={personCounty}
					town={personTown}
					id={id}
					noButtons={true}
				/>
			</aside>
		</div>
	);
};
export default Mail;
