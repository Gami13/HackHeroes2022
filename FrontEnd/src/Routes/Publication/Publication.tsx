import React, { useContext, useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import style from './Publication.module.css';
import Publication from '../../Components/Publication/Publication';
import * as layouts from '../../layouts.module.css';
import Tag from '../../Components/Main/Tag/Tag';
import useIsFirstRender from '../../isFirstRender';
import Comment from '../../Components/Comment/Comment';
import Button from '../../Components/Main/Button/Button';
import TextArea from '../../Components/Main/TextArea/TextArea';
import States from '../../Components/States';

const PublicationPage = () => {
	const { id } = useParams();
	const isFirstRender = useIsFirstRender();

	const [publication, setPublication] = useState<any | undefined>();
	const [comments, setComments] = useState<any | undefined>();

	const [textAreaValue, setTextAreaValue] = useState<string>('');

	const context = useContext(States);

	async function fetchPublication() {
		let res = await fetch(`http://localhost:3000/publicationes/${id}`);
		let json = await res.json();
		console.log(json.publication);
		setPublication(json.publication);
	}

	async function fetchComment() {
		let res = await fetch(`http://localhost:3000/comments/${id}`);
		let json = await res.json();
		setComments(json.comments);
	}

	async function upload() {
		if (textAreaValue.length < 1) return;
		const response = await fetch('http://localhost:3000/comment', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				userId: context.userID,
				publicationId: id,
				text: textAreaValue,
			}),
		});

		fetchComment();
	}

	isFirstRender ? fetchPublication() : null;
	isFirstRender ? fetchComment() : null;

	return (
		<div className={[layouts.center, style.main].flat().join(' ')}>
			<Publication
				disabled={true}
				id={publication?.id}
				date={new Intl.DateTimeFormat('en-Gb').format(
					new Date(publication?.date)
				)}
				user={publication?.firstName + ' ' + publication?.lastName}
				title={publication?.title}
				body={publication?.body}
				footer={publication?.footer?.map((f: any, i: number) => (
					<Tag
						key={i}
						text={f.text}
						backgroundColor={'var(--' + f.color + ')'}
					/>
				))}
			></Publication>
			<div className={style.commentInput}>
				<TextArea
					text={textAreaValue}
					onChange={(e) => {
						setTextAreaValue(e.target.value);
					}}
					className={style.textarea}
					rows={4}
					maxLength={500}
					minLength={1}
					placeholder="Napisz komentarz..."
				></TextArea>
				<Button onClick={upload}>Skomentuj</Button>
			</div>
			<div className={style.commentSection}>
				<p>Komentarze</p>
				{comments?.map((c: any, i: number) => (
					<Comment
						id={c?.userId}
						date={new Intl.DateTimeFormat('en-Gb').format(new Date(c?.date))}
						user={c?.firstName + ' ' + c?.lastName}
						body={c?.text}
					></Comment>
				))}
			</div>
		</div>
	);
};
export default PublicationPage;
