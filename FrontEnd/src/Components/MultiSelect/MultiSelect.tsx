import React, { ReactNode, useEffect, useRef } from 'react';
import useIsFirstRender from '../../isFirstRender';
import Tag from '../Main/Tag/Tag';
import style from './MultiSelect.module.css';
interface Option {
	value: string;
	label: ReactNode | string;
	id?: any;
}

interface MultiSelectProps {
	className?: string[] | string;
	classNameList?: string[] | string;
	classNameItem?: string[] | string;
	classNameMain?: string[] | string;
	options: Option[];
	title?: string;
	returnSetter: (value: any) => void;
	getFuncton?: (value: any) => void;
}

const MultiSelect = (props: MultiSelectProps) => {
	/* TODO: USTAWIC POPRAWNE TYPY */

	const [options, setOptions] = React.useState<any>(props.options);
	const [isFolded, setIsFolded] = React.useState(true);
	const [selected, setSelected] = React.useState<Option[] | any>([]);
	const [available, setAvailable] = React.useState<Option[] | any>(
		props.options.map((option, index) => ({ ...option, id: index })) || []
	);

	if (props.getFuncton) {
		if (useIsFirstRender()) {
			props.getFuncton(setAvailable);
		}
	}

	// todo pass fetch

	function select(event: any) {
		const id = event.currentTarget.id;
		const selectedOption = available.find((option: any) => option.id == id);
		setSelected([...selected, selectedOption]);
		setAvailable(available.filter((option: any) => option.id != id));
	}
	function unselect(event: any) {
		console.log('unselect');
		const id = event.currentTarget.id;
		const unselectedOption = selected.find((option: any) => option.id == id);
		setAvailable([...available, unselectedOption]);
		setIsFolded(false);
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

	useEffect(() => {
		if (available.length == 0) {
			setIsFolded(true);
		}
	}, [available]);

	return (
		<div
			ref={whole}
			className={[style.multiSelect, props.className].flat().join(' ')}
		>
			<div
				onClick={(e) => {
					if (
						!children.current.some((child: any) => child.contains(e.target))
					) {
						setIsFolded(!isFolded);
					}
				}}
				title="placeholder"
				className={[props.classNameMain, style.main].flat().join(' ')}
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

				<svg
					xmlns="http://www.w3.org/2000/svg"
					height="48"
					width="48"
					className={isFolded || available.length == 0 ? null : style.svgOpen}
				>
					<path d="m24 30.8-12-12 2.15-2.15L24 26.5l9.85-9.85L36 18.8Z" />
				</svg>
			</div>
			<ul
				className={[
					props.classNameList,
					style.list,
					isFolded ? style.folded : null,
				]
					.flat()
					.join(' ')}
			>
				{available.map((option: Option, index: number) => (
					<li ref={(el) => (children.current[option.id] = el)} key={index}>
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
