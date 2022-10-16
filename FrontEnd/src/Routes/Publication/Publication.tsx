import React from 'react';
import { useParams } from 'react-router-dom';
import style from './Publication.module.css';
import Switch from '../../Components/Switch/Switch';
import SwitchLabeled from '../../Components/SwitchLabeled/SwitchLabeled';
import MultiSelect from '../../Components/MultiSelect/MultiSelect';

const Publication = () => {
	const { id } = useParams();
	const [test, setTest] = React.useState(false);
	const [selections, setSelections] = React.useState([]);
	function toggle() {
		setTest(!test);
	}
	return (
		<div className={style.publication}>
			<h1>Selections: {selections}</h1>
			<h1>{test.toString()}</h1>
			<Switch func={toggle} />
			<SwitchLabeled
				func={toggle}
				id="switch"
				title="le switch"
				label="le switch"
			/>
			<MultiSelect
				options={[
					{ value: 'test1', label: 'test1' },
					{ value: 'test2', label: 'test2' },
				]}
				returnSetter={setSelections}
			/>

			<h1>{id}</h1>
		</div>
	);
};
export default Publication;
