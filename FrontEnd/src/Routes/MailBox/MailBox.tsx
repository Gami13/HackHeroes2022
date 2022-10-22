import { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import layouts from '../../layouts.module.css';
import Button from '../../Components/Main/Button/Button';
import style from './MailBox.module.css';
import Input from '../../Components/Main/Input/Input';
import Box from '../../Components/Main/Box/Box';
import CheckBox from '../../Components/Main/CheckBox/CheckBox';

const MailBox = () => {
	return (
		<>
			<div className={[layouts.center, style.center].flat().join(' ')}>
				<span>
					<h1>Lista Kontaktów</h1>
				</span>
				<ul className={style.contactList}>
					<li className={style.contact}>
						<img
							src="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
							alt={'chuj w dupe frytaka'}
						/>
						<div>
							<p>name</p>
							<p>tagi-</p>
						</div>
					</li>
					<li className={style.contact}>
						<img
							src="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
							alt={'chuj w dupe frytaka'}
						/>
						<div>
							<p>name</p>
							<p>tagi-</p>
						</div>
					</li>
					<li className={style.contact}>
						<img
							src="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
							alt={'chuj w dupe frytaka'}
						/>
						<div>
							<p>name</p>
							<p>tagi-</p>
						</div>
					</li>
				</ul>
			</div>
		</>
	);
};
export default MailBox;
