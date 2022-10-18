import React, { ReactNode, useEffect, useRef } from 'react';
import Tag from '../Main/Tag/Tag';
import style from './MultiSelect.module.css';
type Option = {
	value: string;
	label: ReactNode | string;
	id?: any;
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
	function select(event: any) {
		const id = event.currentTarget.id;
		const selectedOption = available.find((option: any) => option.id == id);
		setSelected([...selected, selectedOption]);
		setAvailable(available.filter((option: any) => option.id != id));
	}
	function unselect(event: any) {
		const id = event.currentTarget.id;
		const unselectedOption = selected.find((option: any) => option.id == id);
		setAvailable([...available, unselectedOption]);
		setSelected(selected.filter((option: any) => option.id != id));
	}

	useEffect(() => {
		let returnable: any[] = [];
		selected.forEach((option: any) => {
			returnable.push({ value: option.value, label: option.label });
		});
		props.returnSetter(returnable);
	}, [selected]);
	const whole: any = useRef(null);
	const children: any = useRef([]);
	const foldMenu = (e: any) => {
		if (children.current != null && isFolded == false) {
			if (whole.current && !whole.current.contains(e.target)) {
				setIsFolded(true);
			}
		}
	};
	document.addEventListener('mousedown', foldMenu);

	return (
		<div ref={whole} className={[style.multiSelect, props.className].join(' ')}>
			<span>Multi Select</span>
			<button
				onClick={(e) => {
					if (
						!children.current.some((child: any) => child.contains(e.target))
					) {
						setIsFolded(!isFolded);
					}
				}}
				title="placeholder"
				className={[props.classNameMain, style.main].join(' ')}
			>
				<ul className={style.selectedList}>
					{selected.map((option: Option) => (
						<li
							ref={(el) => (children.current[option.id] = el)}
							key={option.id}
							id="selected"
						>
							<button id={option.id} onClick={unselect}>
								{option.label}
							</button>
						</li>
					))}
				</ul>

				<svg xmlns="http://www.w3.org/2000/svg" height="48" width="48">
					<path d="m24 30.8-12-12 2.15-2.15L24 26.5l9.85-9.85L36 18.8Z" />
				</svg>
			</button>
			<ul
				className={[
					props.classNameList,
					style.list,
					isFolded ? style.folded : null,
				].join(' ')}
			>
				{available.map((option: Option) => (
					<li
						id="available"
						ref={(el) => (children.current[option.id] = el)}
						key={option.id}
					>
						<button id={option.id} onClick={select}>
							{option.label}
						</button>
					</li>
				))}
			</ul>
		</div>
	);
};
export default MultiSelect;
