import { useState } from 'react';
import DatePanel from 'react-multi-date-picker/plugins/date_panel';
import Calendar from '../Main/Calendar/Calendar';

interface CalendarWithTagsProps {
	className?: string[] | string;
	tags?: { [key: number]: string };
	updateTags?: (tags: { [key: number]: string }) => void;
}
const CalendarWithTags = (props: CalendarWithTagsProps) => {
	const { className } = props;
	const tags = props.tags || {
		1665834090446: 'KYS',
	};

	return (
		<Calendar
			readOnly={true}
			value={Object.keys(tags).map((key) => new Date(parseInt(key)))}
			plugins={[
				<DatePanel
					position="right"
					sort="color"
					removeButton={false}
					// className={style.data}
					formatFunction={(data) => {
						return (
							<>
								{tags[data.date?.toDate().getTime() || 0] +
									' ' +
									data.date?.toString()}
							</>
						);
					}}
				/>,
			]}
		/>
	);
};
export default CalendarWithTags;
