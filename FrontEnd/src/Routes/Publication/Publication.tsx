import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import style from './Publication.module.css';
import Publication from '../../Components/Publication/Publication';
import * as layouts from '../../layouts.module.css';
import Tag from '../../Components/Main/Tag/Tag';

const PublicationPage = () => {
	const { id } = useParams();
	const [selections, setSelections] = useState<any>([]);
	const [publicationDate, setPublicationDate] = useState<Date>();
	const [publicationUserFirstName, setPublicationUserFirstName] =
		useState<string>('');
	const [publicationUserLastName, setPublicationUserLastName] =
		useState<string>('');
	const [publicationTitle, setPublicationTitle] = useState<string>('');
	const [publicationBody, setPublicationBody] = useState<string>('');
	const [publicationFooter, setPublicationFooter] = useState<any[]>([]);

	return (
		<div className={layouts.center}>
			<Publication
				id={id || ''}
				date={new Intl.DateTimeFormat('en-Gb').format(publicationDate)}
				user={publicationUserFirstName + ' ' + publicationUserLastName}
				title={publicationTitle}
				body={publicationBody}
				footer={publicationFooter.map((f: any, i: number) => (
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
