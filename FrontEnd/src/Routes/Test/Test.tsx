import { useEffect, useState, useRef } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import layouts from '../../layouts.module.css';
import MessagesUserCard from '../../Components/MessagesUserCard/MessagesUserCard';
import style from './test.module.css';

const Test = () => {
	const [uploadedImage, setUploadedImage] = useState<any>();
	const [check, setCheck] = useState(false);
	async function fileUploadInputChange(file: any | undefined) {
		// let reader = new FileReader();
		// reader.onload = function (e) {
		// 	setUploadedImage(e.target.result);
		// 	console.log(uploadedImage);
		// };
		if (!file) return;
		console.log(file);
		let form = new FormData();
		form.append('photo', file);
		form.append('userId', '106798720795811136');
		console.log(JSON.stringify(form));
		const response = await fetch('http://localhost:3000/addPhoto', {
			method: 'POST',
			body: form,
		});
		console.log(JSON.stringify(response));
	}
	console.log(uploadedImage);
	return (
		<>
			<div className={layouts.center}>
				<MessagesUserCard></MessagesUserCard>
			</div>
		</>
	);
};
export default Test;
