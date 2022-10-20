import { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import layouts from '../../layouts.module.css';
import Button from '../../Components/Main/Button/Button';
import style from './Mail.module.css';

const Mail = () => {
	return (
		<>
			<div className={layouts.center}>
				<Button type="button">Dalej</Button>
			</div>
		</>
	);
};
export default Mail;
