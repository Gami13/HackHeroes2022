import React, { useState, useEffect, useContext } from 'react';
import { useNavigate } from 'react-router-dom';
import FormInput from '../../Components/FormInput/FormInput';
import Form from '../../Components/Main/Form/Form';

import Label from '../../Components/Main/Label/Label';

import States from '../../Components/States';
import layouts from '../../layouts.module.css';
import Tag from '../../Components/Main/Tag/Tag';
import style from './Admin.module.css';
import MultiSelect from '../../Components/MultiSelect/MultiSelect';
import Button from '../../Components/Main/Button/Button';
const Admin = () => {
	const [description, setDescription] = useState('');
	const [phoneNumber, setPhoneNumber] = useState('');
	const [address, setAddress] = useState('');

	const context = useContext(States);
	const navigate = useNavigate();
	const [tags, setTags] = useState([]);
	const [personImage, setPersonImage] = useState(
		'http://localhost:3000/userProfileImage/1'
	);
	const [file, setFile] = useState<File>();
	async function updateData() {
		if (!context.userRanks.some((rank) => rank == '1')) {
			navigate('/');
		}
		if (!file) return;
		let form = new FormData();
		form.append('description', description);
		form.append('phoneNumber', phoneNumber);
		form.append('address', address);
		form.append('personImage', file);
		form.append('tags', JSON.stringify(tags));
		form.append('userId', context.userID);
		form.append('email', context.userEmail);
		form.append('token', context.userToken);
		form.append('ranks', JSON.stringify(context.userRanks));

		let res = await fetch(`http://localhost:3000/setAdminData`, {
			method: 'POST',
			body: form,
		});
		let data = await res.json();
		console.log(data);
		if (data.status == 'success') {
			console.log('success');
		} else {
			console.log('error');
		}
	}
	function updateImage(e: any) {
		console.log(e.target.files[0]);
		let file = e.target.files[0];
		let reader = new FileReader();
		setFile(file);
		reader.readAsDataURL(file);
		reader.onload = function () {
			setPersonImage(reader.result as string);
		};
	}

	return (
		<Form
			className={[layouts.center, style.form]}
			width="20%"
			height="20%"
			padding={'1rem'}
			onSubmit={(e) => {
				e.preventDefault();
			}}
		>
			<img src={personImage} className={style.img}></img>
			<Label htmlFor="Photo" label="obrazek">
				<input type="file" id="photo" accept="image/*" onChange={updateImage} />
			</Label>
			<Label label="Twój opis">
				<textarea
					defaultValue={'Lubie kebaby tak tak oj tak'}
					onChange={(e) => {
						setDescription(e.target.value);
					}}
				></textarea>
			</Label>
			<FormInput
				onChange={(e) => {
					setPhoneNumber(e.currentTarget.value);
				}}
				label="telefon"
				type="tel"
				id="phoneNumber"
			/>
			<div className={style.tagContainer}>
				<span>Twoje tagi:</span>
				<MultiSelect
					getFuncton={async (setTags) => {
						let res = await fetch('http://localhost:3000/ranks');
						let json = await res.json();
						let data = json.tags.map((option: any, index: number) => ({
							value: option.id,
							label: (
								<Tag
									className={style.tag}
									text={option.name}
									backgroundColor={option.color}
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
					returnSetter={setTags}
				/>
			</div>
			<FormInput
				onChange={(e) => {
					setAddress(e.currentTarget.value);
				}}
				label="Adres:"
				type="text"
				id="address"
			/>
			<Button onClick={updateData} type="submit">
				Zapisz
			</Button>
		</Form>
	);
};
export default Admin;
