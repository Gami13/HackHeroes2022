import React from 'react';
import { useParams } from 'react-router-dom';
import style from './Publication.module.css';

const Publication = () => {
	const { id } = useParams();
	return (
		<div className={style.publication}>
			<h1>{id}</h1>
		</div>
	);
};
export default Publication;
