import style from './Select.module.css';
interface SelectProps {
	id?: string;
	name?: string;
	value?: string;
	placeholder?: string;
	className?: string | string[];
	options: { value: string; title: string }[];
	startValue?: string;
	onBlur?: (e: React.FocusEvent<HTMLSelectElement>) => void;
	onChange?: (e: React.ChangeEvent<HTMLSelectElement>) => void;
}

const Select = (props: SelectProps) => {
	const { id, className, options, startValue, onBlur, onChange } = props;
	return (
		<select
			id={id}
			className={[style.select, className].flat().join(' ')}
			onBlur={onBlur}
			onChange={onChange}
		>
			{startValue ? (
				<option defaultValue={'?'} className={style.disabled}>
					{startValue}
				</option>
			) : null}
			{options.map((option, index) => (
				<option key={index} value={option.value}>
					{option.title}
				</option>
			))}
		</select>
	);
};
export default Select;
