import { SetStateAction, useRef, useState } from 'react';
import FormInput from '../FormInput/FormInput';
import Button from '../Main/Button/Button';
import Calendar from '../Main/DatePicker/DatePicker';
import Input from '../Main/Input/Input';
import style from './ReminderInput.module.css';
import layouts from '../../layouts.module.css';
import Label from '../Main/Label/Label';

interface ReminderInputProps {
	onSubmit?: (event: React.FormEvent<HTMLFormElement>) => void;
	className?: string[] | string;
	datalist: string;
}
const ReminderInput = (props: ReminderInputProps) => {
	const { onSubmit, className } = props;

	const [title, setTitle] = useState('');
	const [date, setDate] = useState(new Date());

	let dateFormat = Intl.DateTimeFormat('pl-PL', {
		weekday: 'short',
		year: 'numeric',
		month: 'short',
		day: 'numeric',
	});

	return (
		<div
			className={[style.reminderForm, className, layouts.center]
				.flat()
				.join(' ')}
		>
			<FormInput
				label="Tytuł"
				type="text"
				id="why"
				value={title}
				className={style.title}
				onChange={(e) => setTitle(e.target.value)}
				width="24rem"
				list={props.datalist}
			></FormInput>
			<Label label="data">
				<Calendar
					containerClassName={[style.calendar]}
					value={date}
					onChange={(date: SetStateAction<Date>) => {
						setDate(date);
					}}
				/>
			</Label>
		</div>
	);
};
export default ReminderInput;
