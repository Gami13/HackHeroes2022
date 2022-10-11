import React from 'react';
import Box from '../Box/Box';
import style from './Notification.module.css';

interface NotificationProps {
	icon: 'success' | 'general' | 'error' | string;
	title?: any;
	body?: any;
	footer?: any;
}

function Notification(props: NotificationProps) {
	const { icon, title, body, footer } = props;

	const defaultIcons = {
		success: 'check-circle-fill',
		general: 'question-circle-fill',
		error: 'exclamation-circle-fill',
	};

	//@ts-ignore
	let path = '../../../assets/svgs/' + defaultIcons[icon] + '.svg';

	return (
		<div className={style.notificationContainer}>
			<img
				src={require('../../../assets/svgs/question-circle-fill.svg')}
				alt="icon"
			/>
			<h1>{title}</h1>
			<div>{body}</div>
			<div className={style.notifBtn}>{footer}</div>
		</div>
	);
}

Notification.defaultProps = {
	icon: 'general',
};

export default Notification;
