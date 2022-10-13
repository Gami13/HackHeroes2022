import Calendar from 'react-calendar';

import Input from '../../Components/Main/Input/Input';
import ReminderInput from '../../Components/ReminderInput/ReminderInput';
import style from './ReminderSettings.module.css';

import layouts from '../../layouts.module.css';
import Form from '../../Components/Main/Form/Form';
const ReminderSettings = () => {
	return (
		<div className={[layouts.center, style.container].join(' ')}>
			<Form>
				<h1>Przypominajka</h1>
				{/* <Calendar className={style.calendar} /> */}

				<ReminderInput></ReminderInput>
			</Form>
		</div>
	);
};
export default ReminderSettings;
