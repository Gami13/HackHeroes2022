import React from 'react';
import Box from '../Box/Box';

interface PopUpProps {
	children?: any;
}

function PopUp(props: PopUpProps) {
	return (
		<div>
			<Box>{props.children}</Box>
		</div>
	);
}

export default PopUp;
