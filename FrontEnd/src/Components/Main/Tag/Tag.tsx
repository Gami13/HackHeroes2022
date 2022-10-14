import type { Property } from 'csstype';
import { CSSProperties } from 'react';
import style from './Tag.module.css';

interface TagProps {
	text: string;
	emoji?: string;
	backgroundColor?: Property.BackgroundColor | null;
	className?: string[] | string;
}

function Tag(props: TagProps) {
	const { text, emoji, backgroundColor, className } = props;

	return (
		<div
			className={[className, style.tag].join(' ')}
			style={{ backgroundColor: backgroundColor } as CSSProperties}
		>
			<div className={style.emoji}>{emoji}</div>
			<p className={style.text}>{text}</p>
		</div>
	);
}

Tag.defaultProps = {
	backgroundColor: 'var(--red)',
};

export default Tag;
