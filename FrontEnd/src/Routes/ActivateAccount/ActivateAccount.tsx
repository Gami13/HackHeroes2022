import { useEffect } from 'react';
import { Link, useParams } from 'react-router-dom';
import Box from '../../Components/Main/Box/Box';
import Button from '../../Components/Main/Button/Button';
import Form from '../../Components/Main/Form/Form';
import style from './ActivateAccount.module.css';

/**
 *
 * @description Component for activating account
 */
const ActivateAccount = (props: any) => {
	const { token } = useParams();
	async function verifyAccount(token: string) {
		fetch('http://localhost:5000/ActivateAccount', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				token: token,
			}),
		});
	}
	useEffect(() => {
		verifyAccount(token as string);
	}, []);

	return (
		<div className={style.container}>
			<svg
				xmlns="http://www.w3.org/2000/svg"
				fill="none"
				viewBox="0 0 24 24"
				strokeWidth={1.5}
				stroke="currentColor"
				className="w-6 h-6"
			>
				<path
					strokeLinecap="round"
					strokeLinejoin="round"
					d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
				/>
			</svg>
			<svg
				xmlns="http://www.w3.org/2000/svg"
				fill="none"
				viewBox="0 0 24 24"
				strokeWidth={1.5}
				stroke="currentColor"
				className="w-6 h-6"
			>
				<path
					strokeLinecap="round"
					strokeLinejoin="round"
					d="M9.75 9.75l4.5 4.5m0-4.5l-4.5 4.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
				/>
			</svg>
		</div>
	);
};
export default ActivateAccount;
