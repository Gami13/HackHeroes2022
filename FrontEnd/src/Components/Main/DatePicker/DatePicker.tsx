import { Calendar as Cal } from 'react-calendar';
import style from './DatePicker.module.css';
import DatePick from 'react-multi-date-picker';
import './DatePicker.css';

import gregorian_pl from './gregorian_pl';

interface DatePickerProps {
	id?: string;
	className?: string[] | string;
	containerClassName?: string[] | string;
	value?: Date;
	onChange?: (date: any) => void;
	plugins?: any;
}

const DatePicker = (props: DatePickerProps) => {
	const { id, className, containerClassName, value, onChange } = props;
	return (
		<DatePick
			containerClassName={[containerClassName].join(' ')}
			locale={gregorian_pl}
			inputClass={style['custom-input']}
			className={['custom-calendar', className].join(' ')}
			plugins={props.plugins}
			// className={[props.className].join(' ')}
			// defaultActiveStartDate={props.defaultActiveStartDate}
			value={value}
			onChange={onChange}
		></DatePick>
	);
};
export default DatePicker;
