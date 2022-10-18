import React, { useEffect } from 'react';
import { useParams } from 'react-router-dom';
import style from './Publication.module.css';
import Switch from '../../Components/Switch/Switch';
import SwitchLabeled from '../../Components/SwitchLabeled/SwitchLabeled';
import MultiSelect from '../../Components/MultiSelect/MultiSelect';
import Tag from '../../Components/Main/Tag/Tag';
import DataList from '../../Components/DataList/DataList';
import layouts from '../../layouts.module.css';

const Publication = () => {
	const { id } = useParams();
	const [test, setTest] = React.useState(false);
	const [selections, setSelections] = React.useState<any>([]);
	function toggle() {
		setTest(!test);
	}

	return (
		<div className={layouts.center}>
			<h1>MultiSelect selections</h1>
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
			/>
			<MultiSelect
				options={[
					{ value: 'test1', label: <Tag text="Zgone" emoji="🕸" /> },
					{ value: 'test2', label: <Tag text="Zgubhhione" emoji="🕸" /> },
					{ value: 'test1', label: <Tag text="Zgubione" emoji="🕸" /> },
					{ value: 'test2', label: <Tag text="Zgubione" emoji="🕸" /> },
					{
						value: 'test1',
						label: <Tag text="Zgufjghjggdfgf fbione" emoji="🕸" />,
					},
					{ value: 'test2', label: <Tag text="Zone" emoji="🕸" /> },
				]}
				returnSetter={setSelections}
			/>

			<h1>{id}</h1>
		</div>
	);
};
export default Publication;
