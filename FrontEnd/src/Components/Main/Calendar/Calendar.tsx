import { Calendar as Cal } from 'react-multi-date-picker';
import '../DatePicker/DatePicker.css';
import greogrian_pl from '../DatePicker/gregorian_pl';
import { DateObject } from 'react-multi-date-picker';

interface CalendarProps {
	className?: string[] | string;
	readOnly?: boolean;
	value?: Date | Date[] | DateObject | DateObject[];
	plugins?: any[];
}
const Calendar = (props: CalendarProps) => {
	const { className, readOnly, value, plugins } = props;
	console.log(plugins);
	return (
		<Cal
			locale={greogrian_pl}
			plugins={plugins}
			multiple={typeof value === 'object' && value !== null ? true : false}
			value={value}
			readOnly={readOnly}
			className={['custom-calendar', className].join(' ')}
		></Cal>
	);
};

export default Calendar;
