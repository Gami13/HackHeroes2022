import React from 'react';

interface NotificationProps {
	icon: string;
	title?: any;
	body?: any;
	footer?: any;
}

function Notification(props: NotificationProps) {
	const defaultIcons = {
		success: 'check-circle-fill',
		error: 'exclamation-octagon-fill',
	};

	return (
		<div>
			<div>
				<img
					src={
						//@ts-ignore
						require('../../public/svgs/' + defaultIcons[props.icon] + '.svg')
					}
					alt="icon"
				/>
			</div>
			<h1>{props.title}</h1>
			<div>{props.body}</div>
			<div>{props.footer}</div>
		</div>
	);
}

export default Notification;
