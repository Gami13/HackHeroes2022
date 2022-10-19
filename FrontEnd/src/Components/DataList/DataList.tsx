import React from 'react';
import style from './DataList.module.css';
import Input from '../Main/Input/Input';
interface DataListProps {
	className?: string;
	data: string[];
	id?: string;
	placeholder?: string;
	title?: string;
	disabled?: boolean;
	onBlur?: (event: React.FocusEvent<HTMLInputElement>) => void;
	onChange?: (event: React.ChangeEvent<HTMLInputElement>) => void;
	errors?: string[];
}
const DataList = (props: DataListProps) => {
	const { className, data, id, placeholder, title, disabled, errors } = props;
	return (
		<div className={[style.dataList, props.className].join(' ')}>
			{/* 	
			<datalist id={props.id + 'list'}>
				{props.data.map((item, index) => (
					<option key={index} value={item} />
				))}
			</datalist> */}
			<label htmlFor={props.id}>
				<span>{props.title}</span>
				{errors && errors.length > 0 ? (
					<span className={style.error}>{props.errors}</span>
				) : null}
				<Input
					disabled={props.disabled}
					placeholder={props.placeholder}
					type="text"
					id={props.id}
					list={props.id + 'List'}
					onChange={props.onChange}
					onBlur={props.onBlur}
				/>
				<datalist id={props.id + 'List'}>
					{props.data.map((item, index) => (
						<option key={index} value={item} />
					))}
				</datalist>
			</label>
		</div>
	);
};
export default DataList;
