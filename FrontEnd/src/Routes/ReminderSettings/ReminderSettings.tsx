import Calendar from 'react-calendar';
import 'react-calendar/dist/Calendar.css';
import style from './ReminderSettings.module.css';
const ReminderSettings = () => {
	return (
		<div>
			<h1>Reminder Settings</h1>
			<Calendar className={style.calendar} />
		</div>
	);
};
export default ReminderSettings;
