import React from 'react';
import style from './CreatePublication.module.css';
import { useNavigate } from 'react-router-dom';
import Box from '../Main/Box/Box';
import Input from '../Main/Input/Input';
import TextArea from '../Main/TextArea/TextArea';
import Button from '../Main/Button/Button';
import MultiSelect from '../MultiSelect/MultiSelect';

interface PublicationProps {
	width?: string;
	height?: string;
	user?: string;
	date?: string;
	title?: any;
	body?: any;
	footer?: any[] | any;
	className?: string[] | string;
	id?: string;
}

function Publication(props: PublicationProps) {
	const { width, height, user, date, title, body, footer, className } = props;
	const [selections, setSelections] = React.useState<any>([]);

	selections.map((x: any) => (
		<p>
			{x.value}- {x.label}
		</p>
	));

	return (
		<Box
			className={style.box}
			width={width}
			height={'fit-content'}
			display="grid"
			backgroundColor={null}
			gridTemplateColumns="1fr"
			gridTemplateRows="fit-content(1rem) fit-content(4rem) 1fr fit-content(1rem)"
			gap="0.5rem"
		>
			<div className={style.info}>
				<p>12/12/2022</p>
				<p>Boby Drop Tables</p>
			</div>
			<Input className={style.title} type="text" width="100%" maxLength={64} placeholder="Tytuł"/>
			<TextArea className={style.body} rows={8} maxLength={500} placeholder="Zawartość...">
				
			</TextArea>
			<div className={style.footer}>
				<MultiSelect className={style.multiSelect}
					options={[
						{ value: 'test1', label: 'test1' },
						{ value: 'test2', label: 'test2' },
					]}
					returnSetter={setSelections}
				></MultiSelect>
			</div>
			<div className={style.actions}>
				<Button>Anuluj</Button>
				<Button>Opublikuj</Button>
			</div>
		</Box>
	);
}

Publication.defaultProps = {
	width: '40rem',
	height: '12rem',
};

export default Publication;
