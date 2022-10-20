// import { useState } from 'react';
// import useIsFirstRender from '../../isFirstRender';
// import Publication from '../Publication/Publication';
// interface MainPagePublicationProps {
// 	id?: number;
// 	className?: string;
// 	key?: number | null | undefined;
// 	data: any;
// }
// const MainPagePublication = (props) => {
// 	const { id, className, key, data } = props;

// 	const [pub, setPub] = useState<any>({});

// 	const firstRendered = useIsFirstRender();
// 	if (firstRendered) {
//         const w = async ()=>{
//             fetch(`http://localhost:3000/publications/${id}`)
//         }
//         w()
// 	}
// 	return (
// 		<Publication
// 			id={pub.id}
// 			date={
// 				pub.date
// 					? new Intl.DateTimeFormat('en-Gb').format(new Date(pub.date))
// 					: null
// 			}
// 			user={pub.firstName + ' ' + pub.lastName}
// 			title={pub.title}
// 			body={pub.body}
// 			footer={pub.footer}
// 		/>
// 	);
// };
// export default MainPagePublication;
