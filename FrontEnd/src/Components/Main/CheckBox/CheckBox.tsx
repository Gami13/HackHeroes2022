import React from 'react';

interface CheckBoxProps {
	id?: string;
}

function CheckBox(props: CheckBoxProps) {
	return <input id={props.id} type="checkbox"></input>;
}

export default CheckBox;
