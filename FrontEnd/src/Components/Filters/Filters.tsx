import React from 'react';
import style from './Filters.module.css';
interface FiltersProps {
	className?: string;
	heading: string;
	children?: React.ReactNode;
}
const Filters = (props: FiltersProps) => {
	return (
		<div className={[style.filters, props.className].join(' ')}>
			<h1>{props.heading}</h1>
			<div className={style.filterList}>{props.children}</div>
		</div>
	);
};
export default Filters;
