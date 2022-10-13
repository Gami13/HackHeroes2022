import { useEffect, useState } from 'react';
import { Link, useParams, useNavigate } from 'react-router-dom';
import Box from '../../Components/Main/Box/Box';
import Button from '../../Components/Main/Button/Button';
import Form from '../../Components/Main/Form/Form';
import style from './ActivateAccount.module.css';
import useIsFirstRender from '../../isFirstRender';

/**
 * TODO: WYSTYLIZOWAC PLS PLS SEBA
 * @description Component for activating account
 */
const ActivateAccount = (props: any) => {
	const navigate = useNavigate();
	const { token } = useParams();
	const [status, setStatus] = useState('unknown');
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
		verifyAccount();
	}
	return (
		<>
			<style>
				{`header:first-of-type {display: none;}aside:first-of-type {display: none;}`}
			</style>

			<div className={style.container}>
				{status == 'unknown' ? (
					<h1>DAJ SVG Z PYTAJNIKIEM</h1>
				) : status == 'loading' ? (
					<h1>DAJ LADOWANIE</h1>
				) : status == 'success' ? (
					<h1>DAJ SVG Z CHECKMARKIEM</h1>
				) : status == 'error' ? (
					<h1>DAJ SVG Z X</h1>
				) : (
					<h1>SPADLO Z ROWERKA, DAJ PYTAJNIK</h1>
				)}
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
		</>
	);
};
export default ActivateAccount;
