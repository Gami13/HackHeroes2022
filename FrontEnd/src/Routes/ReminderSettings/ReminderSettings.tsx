import Input from '../../Components/Main/Input/Input';
import ReminderInput from '../../Components/ReminderInput/ReminderInput';
import style from './ReminderSettings.module.css';

import layouts from '../../layouts.module.css';
import Form from '../../Components/Main/Form/Form';
import Box from '../../Components/Main/Box/Box';
import { useRef, useState } from 'react';
import Calendar from '../../Components/Main/Calendar/Calendar';
import DatePanel from 'react-multi-date-picker/plugins/date_panel';
import FormInput from '../../Components/FormInput/FormInput';
import colors from 'react-multi-date-picker/plugins/colors';
import { DateObject } from 'react-multi-date-picker';

const tagValid = (tag: string) => {
	return tag.trim().length === 0;
};

const ReminderSettings = () => {
	const [currentTag, setCurrentTag] = useState('tak');

	const [tags, setTags] = useState<{ [key: number]: string }>({});

	const valid = tagValid(currentTag);

	return (
		<div className={[layouts.center].join(' ')}>
			<Box className={style.container} width={null}>
				<h1>Przypominajka</h1>
				{/* <Calendar className={style.calendar} /> */}
				<datalist id="list">
					<option value="KYS"></option>
					{Object.keys(tags).map((key) => (
						<option value={tags[parseInt(key)]} key={parseInt(key)}></option>
					))}
				</datalist>
				<FormInput
					className={style.input}
					id="Data"
					label="TEST"
					type="text"
					list="list"
					value={currentTag}
					onChange={(e) => setCurrentTag(e.target.value)}
					errors={valid ? 'Nieprawidłowa wartość' : null}
					maxLength={20}
				/>
				<Calendar
					className={style.calendar}
					readOnly={valid && Object.keys(tags).length === 0}
					onChange={(dates) => {
						if (!Array.isArray(dates)) return;
						console.log(
							dates,
							dates.length,
							dates.map((date) => date.toDate().getTime())
						);
						//replace all tags with new ones
						let newTags: { [key: number]: string } = {};
						for (let i = 0; i < dates.length; i++) {
							let time = dates[i].toDate().getTime();
							console.log(time, tags[time]);
							if (tags[time] === undefined) newTags[time] = currentTag;
							else newTags[time] = tags[time];
						}
						setTags(newTags);
					}}
					plugins={[
						<DatePanel
							position="right"
							sort="color"
							className={style.data}
							formatFunction={(data) => {
								return (
									<>
										{tags[data.date?.toDate().getTime() || 0] +
											' ' +
											data.date?.toString()}
									</>
								);
							}}
						/>,
					]}
				/>
			</Box>
		</div>
	);
};
export default ReminderSettings;
