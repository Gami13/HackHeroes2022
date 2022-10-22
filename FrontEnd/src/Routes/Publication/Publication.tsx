import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import style from './Publication.module.css';
import Publication from '../../Components/Publication/Publication';
import * as layouts from '../../layouts.module.css';
import Tag from '../../Components/Main/Tag/Tag';
import useIsFirstRender from '../../isFirstRender';

const PublicationPage = () => {
	const { id } = useParams();
	const isFirstRender = useIsFirstRender();

	const [publication, setPublication] = useState<any | undefined>();

	if (isFirstRender) {
		let w = async () => {
			let res = await fetch(`http://localhost:3000/publicationes/${id}`);
			let json = await res.json();
			setPublication(json.publication);
		};
		w();
		console.log(publication);
	}

	return (
		<div className={layouts.center}>
			<Publication
				disabled={true}
				id={publication?.id}
				date={new Intl.DateTimeFormat('en-Gb').format(
					new Date(publication?.date | 0)
				)}
				user={publication?.user?.firstName + ' ' + publication?.user?.lastName}
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
		</div>
	);
};
export default PublicationPage;
