import { useEffect, useState } from 'react';
import { Link, useParams, useNavigate } from 'react-router-dom';
import Box from '../../Components/Main/Box/Box';
import Button from '../../Components/Main/Button/Button';
import Form from '../../Components/Main/Form/Form';
import style from './ActivateAccount.module.css';
import useIsFirstRender from '../../isFirstRender';

const ActivateAccount = (props: any) => {
	const navigate = useNavigate();
	const { token } = useParams();
	const [status, setStatus] = useState('error');
	const isFirstRender = useIsFirstRender();
	function goAway() {
		navigate('/');
	}
	async function verifyAccount() {
		if (status == 'unknown') {
			setStatus('loading');
			let config = {
				method: 'GET',
				headers: {
					Accept: 'application/json',
					'Content-Type': 'application/json',
				},
			};

			const res = await fetch(`http://localhost:3000/verify/` + token, config);
			const json = await res.json();
			console.log(json);
			if (json.status == 'success') {
				setStatus('success');
				setTimeout(goAway, 3000);
			} else {
				setStatus('error');
				console.log(json.message);
			}
		}
	}
	if (isFirstRender) {
		console.log('first render');
		/* verifyAccount(); */
	}
	return (
		<>
			<style>
				{`header:first-of-type {display: none;}aside:first-of-type {display: none;}`}
			</style>

			<Box className={style.container}>
				{status == 'unknown' ? (
					<>
						<svg
							width="100"
							height="100"
							fill="rgb(200, 190, 50)"
							viewBox="0 0 16 16"
						>
							<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.496 6.033h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286a.237.237 0 0 0 .241.247zm2.325 6.443c.61 0 1.029-.394 1.029-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94 0 .533.425.927 1.01.927z" />
						</svg>
						<h1>Co to kurwa za status? uwu</h1>
					</>
				) : status == 'loading' ? (
					<div className={style.loadingCircle}></div>
				) : status == 'success' ? (
					<>
						<svg
							width="100"
							height="100"
							fill="rgb(50, 200, 90)"
							viewBox="0 0 16 16"
						>
							<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
						</svg>
						<h1>Zweryfikano pomyślnie.</h1>
					</>
				) : status == 'error' ? (
					<>
						<svg
							xmlns="http://www.w3.org/2000/svg"
							width="100"
							height="100"
							fill="rgb(200, 50, 50)"
							viewBox="0 0 16 16"
						>
							<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
						</svg>
						<h1>Błąd weryfikacji.</h1>
					</>
				) : (
					<>
						<svg
							width="100"
							height="100"
							fill="rgb(200, 190, 50)"
							viewBox="0 0 16 16"
						>
							<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.496 6.033h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286a.237.237 0 0 0 .241.247zm2.325 6.443c.61 0 1.029-.394 1.029-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94 0 .533.425.927 1.01.927z" />
						</svg>
						<h1>wyjebało</h1>
					</>
				)}
			</Box>
		</>
	);
};
export default ActivateAccount;
