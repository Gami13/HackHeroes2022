import React, { useEffect } from 'react';
import { useParams } from 'react-router-dom';
import style from './Publication.module.css';
import Switch from '../../Components/Switch/Switch';
import SwitchLabeled from '../../Components/SwitchLabeled/SwitchLabeled';
import MultiSelect from '../../Components/MultiSelect/MultiSelect';
import Tag from '../../Components/Main/Tag/Tag';
import DataList from '../../Components/DataList/DataList';
import layouts from '../../layouts.module.css';
import Box from '../../Components/Main/Box/Box';
import Article from '../../Components/Publication/Publication';

const Publication = () => {
	const { id } = useParams();
	const [test, setTest] = React.useState(false);
	const [selections, setSelections] = React.useState<any>([]);
	function toggle() {
		setTest(!test);
	}

	return (
		<div className={layouts.center}>
			<Box>
				<div className={style.info}>
					<p>{'date'}</p>
					<p>{'user'}</p>
				</div>
			</Box>
			{/* <h1>MultiSelect selections</h1>
			{selections.map((x: any) => (
				<p>
					{x.value}- {x.label}
				</p>
			))}
			<h1>{test.toString()}</h1>
			<Switch func={toggle} />
			<SwitchLabeled
				func={toggle}
				id="switch"
				title="le switch"
				label="le switch"
			/>
			<DataList
				title="Województwo: "
				id="wojewodztwa"
				data={['Małopolska', 'Śląskie', 'Mazowieckie']}
				placeholder="Województwo"
			/> */}
		</div>
	);
};
export default Publication;
