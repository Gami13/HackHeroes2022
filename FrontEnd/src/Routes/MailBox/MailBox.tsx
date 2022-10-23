import { useEffect, useState, useContext } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import layouts from '../../layouts.module.css';
import Button from '../../Components/Main/Button/Button';
import States from '../../Components/States';
import style from './MailBox.module.css';
import Input from '../../Components/Main/Input/Input';
import Box from '../../Components/Main/Box/Box';
import CheckBox from '../../Components/Main/CheckBox/CheckBox';
import MessagesUserCard from '../../Components/MessagesUserCard/MessagesUserCard';
import useIsFirstRender from '../../isFirstRender';
import Tag from '../../Components/Main/Tag/Tag';
import PersonCard from '../../Components/PersonCard/PersonCard';
const MailBox = () => {
	const navigate = useNavigate();
	const context = useContext(States);
	const isFirstRender = useIsFirstRender();
	const [contacts, setContacts] = useState<any>();
	async function fetchDzbans() {
		const response = await fetch('http://localhost:3000/getDzbans', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				email: context.userEmail,
				token: context.userToken,
				userId: context.userID,
			}),
		});
		const data = await response.json();

		if (data.status == 'success') {
			setContacts(data.users);
			console.log(data.users);
		}
	}
	if (isFirstRender) {
		fetchDzbans();
	}
	function clicked(e: any) {
		console.log(e.currentTarget.id);
		navigate('/mail/' + e.currentTarget.id);
	}
	return (
		<>
			<div className={[layouts.center, style.center].flat().join(' ')}>
				<span>
					<h1>Wiadomości</h1>
				</span>
				<ul className={style.contactList}>
					{contacts
						? contacts.map((contact: any) => (
								<li
									key={contact.id}
									className={style.contact}
									role="button"
									onClick={clicked}
									id={contact.id}
								>
									<PersonCard
										image={
											'http://localhost:3000/userProfileImage/' + contact.photo
										}
										name={contact.firstName + ' ' + contact.lastName}
										position={
											contact.ranks
												? contact.ranks.map((rank: any, index: number) => (
														<Tag
															text={rank.name}
															backgroundColor={rank.color}
															key={index}
														/>
												  ))
												: null
										}
										description={contact.description}
										voivodeship={contact.wojewodztwo}
										county={contact.powiat}
										town={contact.gmina}
										id={contact.id}
										noButtons={true}
									/>
								</li>
						  ))
						: null}
				</ul>
			</div>
		</>
	);
};
export default MailBox;
