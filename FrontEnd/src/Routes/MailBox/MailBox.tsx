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
import PersonCard from '../../Components/PersonCard/PersonCard';
const MailBox = () => {
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
			setContacts(data.results);
			console.log(data.results);
		}
	}
	if (isFirstRender) {
		fetchDzbans();
	}
	function tak() {}
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
									onClick={tak}
									data-id={contact.id}
								>
									<PersonCard
										image={contact.photo}
										name={contact.firstName + ' ' + contact.lastName}
										position={'asdfasdf'}
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
