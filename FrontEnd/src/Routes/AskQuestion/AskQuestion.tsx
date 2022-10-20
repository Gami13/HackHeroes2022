import { useContext, useEffect, useState } from 'react';
import { Link, useNavigate, useParams } from 'react-router-dom';
import style from './AskQuestion.module.css';

const AskQuestion = () => {
	const { id } = useParams();
	return (
		<div className={style.askQuestion}>
			<h1>a Ja nie lubie miodku: {id}</h1>
		</div>
	);
};
export default AskQuestion;
