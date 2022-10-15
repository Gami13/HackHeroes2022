import React from 'react';
import { useParams } from 'react-router-dom';
import style from './Publication.module.css';
import Switch from '../../Components/Switch/Switch';
import SwitchLabeled from '../../Components/SwitchLabeled/SwitchLabeled';

const Publication = () => {
	const { id } = useParams();
	const [test, setTest] = React.useState(false);
	function toggle() {
		setTest(!test);
	}
	return (
		<div className={style.publication}>
			<h1>{test.toString()}</h1>
			<Switch func={toggle} />
			<SwitchLabeled
				func={toggle}
				id="switch"
				title="le switch"
				label="le switch"
			/>
			<h1>{id}</h1>
		</div>
	);
};
export default Publication;
