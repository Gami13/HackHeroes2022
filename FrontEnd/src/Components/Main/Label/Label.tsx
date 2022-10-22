import style from './Label.module.css';
interface LabelProps {
	label?: string;
	htmlFor?: string;
	id?: string;
	className?: string[] | string;
	children?: any;
}
const label = (props: LabelProps) => {
	const { label, className, children, htmlFor } = props;
	return (
		<label htmlFor={htmlFor} className={[className].flat().join(' ')}>
			<span className={style.label}>{label}</span>
			{children}
		</label>
	);
};

export default label;
