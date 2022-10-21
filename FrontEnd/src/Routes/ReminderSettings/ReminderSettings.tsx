import Input from '../../Components/Main/Input/Input';
import ReminderInput from '../../Components/ReminderInput/ReminderInput';
import style from './ReminderSettings.module.css';

import layouts from '../../layouts.module.css';
import Form from '../../Components/Main/Form/Form';
import Box from '../../Components/Main/Box/Box';
import { useContext, useEffect, useRef, useState } from 'react';
import Calendar from '../../Components/Main/Calendar/Calendar';
import DatePanel from 'react-multi-date-picker/plugins/date_panel';
import FormInput from '../../Components/FormInput/FormInput';
import colors from 'react-multi-date-picker/plugins/colors';
import { DateObject } from 'react-multi-date-picker';
import DataList from '../../Components/DataList/DataList';
import Button from '../../Components/Main/Button/Button';
import States from '../../Components/States';

const tagValid = (tag: string) => {
	return tag.trim().length === 0;
};

const ReminderSettings = () => {
	const [currentTitle, setCurrentTitle] = useState('tak');

	const [titles, setTitles] = useState<{ [key: number]: string }>({});

	const [date, setDate] = useState<DateObject[]>([]);

	const invalid = tagValid(currentTitle);

	const context = useContext(States);

	async function saveReminders() {
		const response = await fetch('http://localhost:3000/reminders', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				data: titles,
				email: context.userEmail,
				token: context.userToken,
				userId: context.userID,
			}),
		});
	}
	return (
		<div className={[layouts.center].join(' ')}>
			<Box className={style.container} width={null}>
				<h1>Przypominajka</h1>
				{/* <Calendar className={style.calendar} /> */}
				<datalist id="list">
					<option value="KYS"></option>
					{Object.keys(titles).map((key) => (
						<option value={titles[parseInt(key)]} key={parseInt(key)}></option>
					))}
				</datalist>
				{/* <DataList/> */}
				<FormInput
					className={style.input}
					id="Data"
					label="Tytuł"
					type="text"
					list="list"
					value={currentTitle}
					onChange={(e) => setCurrentTitle(e.target.value)}
					errors={invalid ? 'Nieprawidłowa wartość' : null}
					maxLength={20}
				/>
				<Calendar
					className={style.calendar}
					readOnly={invalid && Object.keys(titles).length === 0}
					onChange={(dates) => {
						if (!Array.isArray(dates)) return;
						// if (invalid && date.length < dates.length) return;
						console.log(
							invalid,
							date.length,
							dates.length,
							dates.map((date) => date.toDate().getTime())
						);

						//replace all tags with new ones
						let newTags: { [key: number]: string } = {};
						for (let i = 0; i < dates.length; i++) {
							let time = dates[i].toDate().getTime();
							console.log(time, titles[time]);
							if (titles[time] === undefined) newTags[time] = currentTitle;
							else newTags[time] = titles[time];
						}
						setTitles(newTags);
						setDate(dates);
					}}
					value={date}
					plugins={[
						<DatePanel
							position="right"
							sort="color"
							className={style.data}
							removeButton={false}
							formatFunction={(data) => {
								return (
									<>
										<span className={style.panelDate}>
											<p>{titles[data.date?.toDate().getTime() || 0]}</p>
											<p>{data.date?.toString()}</p>
										</span>
										<svg
											width="16"
											height="16"
											fill="rgb(255, 255, 255)"
											viewBox="0 0 16 16"
											onClick={() => {
												setDate(
													date.filter(
														(d) =>
															d.toDate().getTime() !==
															data.date?.toDate().getTime()
													)
												);
											}}
										>
											<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
										</svg>
									</>
								);
							}}
						/>,
					]}
				/>
				<Button onClick={saveReminders}>zapisz</Button>
			</Box>
		</div>
	);
};
export default ReminderSettings;
