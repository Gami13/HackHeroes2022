import { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import layouts from '../../layouts.module.css';

import style from './test.module.css';

const Test = () => {
	const [check, setCheck] = useState(false);
	console.log(check);
	return (
		<>
			<div className={layouts.center}>
				<span className={style.loading}>
					<h1>Ładowanie</h1>
					<h1 className={style.loadingDots}></h1>
				</span>
			</div>
		</>
	);
};
export default Test;
