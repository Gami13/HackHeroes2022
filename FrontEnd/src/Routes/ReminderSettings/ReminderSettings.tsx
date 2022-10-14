import Input from '../../Components/Main/Input/Input';
import ReminderInput from '../../Components/ReminderInput/ReminderInput';
import style from './ReminderSettings.module.css';

import layouts from '../../layouts.module.css';
import Form from '../../Components/Main/Form/Form';
import Box from '../../Components/Main/Box/Box';
import { useRef } from 'react';
import Calendar from '../../Components/Main/Calendar/Calendar';
import DatePanel from 'react-multi-date-picker/plugins/date_panel';
import FormInput from '../../Components/FormInput/FormInput';
import colors from 'react-multi-date-picker/plugins/colors';
import { DateObject } from 'react-multi-date-picker';
const ReminderSettings = () => {
	const test = new DateObject();
	//@ts-ignore
	test.color = 'red';
	let page = 'ReminderSettings';
	return (
		<div className={[layouts.center].join(' ')}>
			<Box className={style.container} width={null}>
				<h1>Przypominajka</h1>
				{/* <Calendar className={style.calendar} /> */}
				<datalist id="list">
					<option value="Zadanie domowe"></option>
				</datalist>
				<FormInput id="test" label="TEST" type="text" />
				<Calendar
					value={test}
					className={style.calendar}
					plugins={[
						<DatePanel
							position="right"
							sort="color"
							className={style.data}
							formatFunction={(data) => {
								return <>{'test' + data.date?.toString()}</>;
							}}
						/>,
					]}
				/>
			</Box>
		</div>
	);
};
export default ReminderSettings;
