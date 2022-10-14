import { Calendar as Cal } from 'react-calendar';
import './calendar.css';

interface CalendarProps {
	id?: string;
	className?: string[] | string;
	defaultActiveStartDate?: Date;
	onChange?: (date: Date) => void;
}

const Calendar = (props: CalendarProps) => {
	return (
		<Cal
			className={[props.className].join(' ')}
			defaultActiveStartDate={props.defaultActiveStartDate}
			onChange={props.onChange}
		></Cal>
	);
};
export default Calendar;
