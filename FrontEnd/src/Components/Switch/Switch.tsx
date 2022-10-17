import React from 'react';
import style from './Switch.module.css';

interface SwitchProps {
	className?: string[] | string;
	disabled?: boolean;
	form?: string;
	name?: string;
	type?: any;
	id?: string;
	title?: string;
	func: () => void;
}

const Switch = (props: SwitchProps) => {
	const [isToggled, setIsToggled] = React.useState(false);
	function switcher() {
		setIsToggled(!isToggled);
		props.func();
	}
	return (
		<button
			id={props.id}
			title={props.title}
			disabled={props.disabled}
			form={props.form}
			name={props.name}
			type={props.type}
			onClick={switcher}
			className={[style.switch, props.className].join(' ')}
		>
			<div
				className={[
					style.track,
					`${isToggled ? style.toggledTrack : null}`,
				].join(' ')}
			>
				<div
					className={[style.ball, `${isToggled ? style.toggled : null}`].join(
						' '
					)}
				></div>
			</div>
		</button>
	);
};
export default Switch;
