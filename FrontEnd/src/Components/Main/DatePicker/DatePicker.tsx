import { Calendar as Cal } from 'react-calendar';
import style from './DatePicker.module.css';
import DatePick from 'react-multi-date-picker';
import './DatePicker.css';

import gregorian_pl from './gregorian_pl';

interface DatePickerProps {
	id?: string;
	className?: string[] | string;
	value?: Date;
	onChange?: (date: any) => void;
}

const DatePicker = (props: DatePickerProps) => {
	return (
		<DatePick
			locale={gregorian_pl}
			inputClass={style['custom-input']}
			className={['custom-calendar', style['custom-calendar']].join(' ')}
			// className={[props.className].join(' ')}
			// defaultActiveStartDate={props.defaultActiveStartDate}
			value={props.value}
			onChange={props.onChange}
		></DatePick>
	);
};
export default DatePicker;
