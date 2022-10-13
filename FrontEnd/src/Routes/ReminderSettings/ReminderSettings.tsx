import Calendar from 'react-calendar';

import Input from '../../Components/Main/Input/Input';
import ReminderInput from '../../Components/ReminderInput/ReminderInput';
import style from './ReminderSettings.module.css';

import layouts from '../../layouts.module.css';
import Form from '../../Components/Main/Form/Form';
import Box from '../../Components/Main/Box/Box';
import { useRef } from 'react';
const ReminderSettings = () => {
	return (
		<div className={[layouts.center, style.container].join(' ')}>
			<Box>
				<h1>Przypominajka</h1>
				{/* <Calendar className={style.calendar} /> */}
				<datalist id="list">
					<option value="Zadanie domowe"></option>
				</datalist>
				<ReminderInput datalist="list"></ReminderInput>
			</Box>
		</div>
	);
};
export default ReminderSettings;
