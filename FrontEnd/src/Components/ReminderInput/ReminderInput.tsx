import { useState } from 'react';
import { Calendar } from 'react-calendar';
import FormInput from '../FormInput/FormInput';
import Button from '../Main/Button/Button';
import Input from '../Main/Input/Input';
import style from './ReminderInput.module.css';
import './calendar.css';

interface ReminderInputProps {
	onSubmit?: (event: React.FormEvent<HTMLFormElement>) => void;
	className?: string[] | string;
}
const ReminderInput = (props: ReminderInputProps) => {
	const { onSubmit, className } = props;

	const [title, setTitle] = useState('');
	const [date, setDate] = useState(new Date());

	const [calendarVisible, setCalendarVisible] = useState(false);

	let dateFormat = Intl.DateTimeFormat('pl-PL', {
		weekday: 'short',
		year: 'numeric',
		month: 'short',
		day: 'numeric',
	});

	return (
		<div className={[style.reminderForm, className].join(' ')}>
			<FormInput
				label="Tytuł"
				type="text"
				id="why"
				value={title}
				className={style.title}
				onChange={(e) => setTitle(e.target.value)}
				width="24rem"
			></FormInput>
			<div className={style.reminderDate}>
				<Button
					className={style.reminderButton}
					onClick={() => setCalendarVisible(!calendarVisible)}
				>
					{dateFormat.format(date)}
				</Button>

				<Calendar
					className={[
						!calendarVisible ? style.calendarHidden : null,
						// style['react-calendar'],
					]}
					defaultActiveStartDate={date}
				/>
			</div>
		</div>
	);
};
export default ReminderInput;
