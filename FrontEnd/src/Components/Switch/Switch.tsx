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
				<svg className={style.switchTrue} viewBox="0 0 16 16">
					<path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z" />
				</svg>

				<svg className={style.switchFalse} viewBox="0 0 16 16">
					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
				</svg>
			</div>
		</button>
	);
};
export default Switch;
