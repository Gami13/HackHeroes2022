import React, { useEffect } from 'react';
import style from './MultiSelect.module.css';
type Option = {
	value: string;
	label: string;
	key?: any;
};
interface MultiSelectProps {
	className?: string[] | string;
	classNameList?: string[] | string;
	classNameItem?: string[] | string;
	classNameMain?: string[] | string;
	options: Option[];
	title?: string;
	returnSetter: (value: any) => void;
}

const MultiSelect = (props: MultiSelectProps) => {
	/* TODO: USTAWIC POPRAWNE TYPY */

	const [isFolded, setIsFolded] = React.useState(true);
	const [selected, setSelected] = React.useState<any>([]);
	const [available, setAvailable] = React.useState<any>(
		props.options.map((option, index) => ({ ...option, id: index }))
	);

	function toggleFold() {
		setIsFolded(!isFolded);
	}
	/* 	useEffect(() => {
		props.returnSetter(selected);
	}, [selected]) */

	return (
		<div
			onClick={toggleFold}
			className={[style.multiSelect, props.className].join(' ')}
		>
			<button className={[props.classNameMain, style.main].join(' ')}>
				<ul>
					<li>
						<button></button>
					</li>
				</ul>
			</button>
			<ul
				className={`${props.classNameList} ${style.list} ${
					isFolded ? style.folded : null
				}`}
			>
				<li>
					<button></button>
				</li>
			</ul>
		</div>
	);
};
export default MultiSelect;
