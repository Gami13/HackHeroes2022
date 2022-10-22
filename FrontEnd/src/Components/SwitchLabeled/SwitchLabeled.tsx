import React from 'react';
import style from './SwitchLabeled.module.css';
import Switch from '../Switch/Switch';

interface SwitchLabeledProps {
	className?: string;
	switchClassName?: string;
	disabled?: boolean;
	form?: string;
	name?: string;
	type?: any;
	id?: string;
	title?: string;
	label?: string;
	func: () => void;
}

const SwitchLabeled = (props: SwitchLabeledProps) => {
	const [isToggled, setIsToggled] = React.useState(false);

	return (
		<label
			className={[props.className, style.switchLabeled].flat().join(' ')}
			htmlFor={props.id}
			form={props.form}
		>
			{props.label}
			<Switch
				disabled={props.disabled}
				form={props.form}
				name={props.name}
				type={props.type}
				id={props.id}
				title={props.title}
				func={props.func}
				className={props.switchClassName}
			/>
		</label>
	);
};
export default SwitchLabeled;
