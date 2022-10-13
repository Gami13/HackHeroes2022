import { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import layouts from '../../layouts.module.css';

import style from './test.module.css';

const Test = () => {
	return (
		<div className={layouts.center}>
			<span class="loading">
				<h1>Ładowanie</h1>
				<h1 class="loadingDots"></h1>
			</span>
		</div>
	);
};
export default Test;
