import { Calendar as Cal } from 'react-calendar';
import style from './DatePicker.module.css';
import DatePick from 'react-multi-date-picker';
import './DatePicker.css';

import gregorian_pl from './gregorian_pl';
import Input from '../Input/Input';

interface DatePickerProps {
	id?: string;
	className?: string[] | string;
	inputClassName?: string[] | string;
	containerClassName?: string[] | string;
	value?: Date;
	onChange?: (date: any) => void;
	plugins?: any;
	maxDate?: Date;
	minDate?: Date;
}

const DatePicker = (props: DatePickerProps) => {
	const {
		id,
		className,
		containerClassName,
		value,
		onChange,
		minDate,
		maxDate,
		inputClassName,
	} = props;
	return (
		<DatePick
			// TODO replace input render={<Input type="text" />}
			containerClassName={[containerClassName].flat().join(' ')}
			locale={gregorian_pl}
			inputClass={[style['custom-input'], inputClassName].flat().join(' ')}
			className={['custom-calendar', className].flat().join(' ')}
			plugins={props.plugins}
			// className={[props.className].flat().join(' ')}
			// defaultActiveStartDate={props.defaultActiveStartDate}
			value={value}
			format="DD/MM/YYYY"
			onChange={onChange}
			maxDate={maxDate}
			minDate={minDate}
		></DatePick>
	);
};
export default DatePicker;
