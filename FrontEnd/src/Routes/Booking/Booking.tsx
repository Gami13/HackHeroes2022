import { useContext, useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import style from './Booking.module.css';

const Booking = () => {
	const { id } = useParams();

	return (
		<div className={style.booking}>
			<h1>Lubie miód: {id}</h1>{' '}
		</div>
	);
};
export default Booking;
