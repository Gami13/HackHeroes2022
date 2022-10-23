import React, { useContext } from 'react';
import style from './CreatePublication.module.css';
import { useNavigate } from 'react-router-dom';
import Box from '../Main/Box/Box';
import Input from '../Main/Input/Input';
import TextArea from '../Main/TextArea/TextArea';
import Button from '../Main/Button/Button';
import MultiSelect from '../MultiSelect/MultiSelect';
import Tag from '../Main/Tag/Tag';
import useIsFirstRender from '../../isFirstRender';
import States from '../States';

interface PublicationProps {
	width?: string;
	height?: string;
	user?: string;
	date?: Date;
	title?: any;
	body?: any;
	footer?: any[] | any;
	className?: string[] | string;
	id?: string;
	afterAdded?: () => void;
}

function Publication(props: PublicationProps) {
	const { width, height, user, date, title, body, footer, className } = props;
	const [selections, setSelections] = React.useState<any>([]);
	const [tags, setTags] = React.useState<any>(footer || []);
	const [titleValue, setTitleValue] = React.useState<any>(title || '');
	const [bodyValue, setBodyValue] = React.useState<any>(body || '');

	const context = useContext(States);
	selections.map((x: any) => (
		<p>
			{x.value}- {x.label}
		</p>
	));

	function clearForm() {
		setSelections([]);
		setTags([]);
		setTitleValue('');
		setBodyValue('');
	}

	async function upload() {
		console.log(selections);
		const response = await fetch('http://localhost:3000/publication', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				title: titleValue,
				body: bodyValue,
				tags: selections.map((x: any) => x.value),
				email: context.userEmail,
				token: context.userToken,
				userId: context.userID,
			}),
		});
		const data = await response.json();
		if (props.afterAdded) props.afterAdded();
		console.log(data);
	}
	// const isFirstRender = useIsFirstRender();
	// if (isFirstRender) {
	// 	let w = async (setTags) => {
	// 		let res = await fetch('http://localhost:3000/tags');
	// 		let json = await res.json();
	// 		setTags(
	// 			json.tags.map((option: any, index: number) => ({
	// 				...option,
	// 				id: index,
	// 			})) || []
	// 		);
	// 	};
	// 	//w();
	// }

	return (
		<Box
			className={[props.className, style.box].flat().join(' ')}
			width={width}
			height={height}
			display="grid"
			backgroundColor={null}
			gridTemplateColumns="1fr"
			gridTemplateRows="fit-content(1rem) fit-content(4rem) 1fr fit-content(1rem)"
			gap="0.5rem"
		>
			<div className={style.info}>
				<p>{new Intl.DateTimeFormat('en-gb').format(date)}</p>
				<p>{user}</p>
			</div>
			<Input
				className={style.title}
				type="text"
				width="100%"
				maxLength={64}
				placeholder="Tytuł"
				value={titleValue}
				onChange={(e) => setTitleValue(e.target.value)}
			/>
			<TextArea
				className={style.body}
				rows={8}
				maxLength={500}
				placeholder="Zawartość..."
				text={bodyValue}
				onChange={(e) => setBodyValue(e.target.value)}
			/>
			<div className={style.footer}>
				<MultiSelect
					className={style.multiSelect}
					getFuncton={async (setTags) => {
						let res = await fetch('http://localhost:3000/tags');
						let json = await res.json();
						console.log(json);
						let data = json.tags.map((option: any, index: number) => ({
							value: option.id,
							label: (
								<Tag
									className={style.tag}
									text={option.text}
									backgroundColor={'var(--' + option.color + ')'}
								/>
							),
						}));
						setTags(
							data.map((option: any, index: number) => ({
								...option,
								id: index,
							})) || []
						);
					}}
					options={[]}
					// options={tags.map((x: any) => {
					// 	return {
					// 		value: x.id,
					// 		label: (
					// 			<Tag text={x.name} backgroundColor={'var(--' + x.color + ')'} />
					// 		),
					// 	};
					// })}
					returnSetter={setSelections}
				/>
			</div>
			<div className={style.actions}>
				<Button className={style.cancelButton}>Anuluj</Button>
				<Button onClick={upload}>Opublikuj</Button>
			</div>
		</Box>
	);
}

export default Publication;
