import type { Property } from 'csstype';
import style from './Tag.module.css';

interface TagProps {
	text: string;
	emoji?: string;
	color: Property.BackgroundColor;
	className?: string[] | string;
}

function Tag(props: TagProps) {
	const { text, emoji, color, className } = props;

	return (
		<div
			className={[className, style.tag].join(' ')}
			style={{ backgroundColor: color }}
		>
			<div className={style.emoji}>{emoji}</div>
			<p className={style.text}>{text}</p>
		</div>
	);
}

Tag.defaultProps = {
	color: 'var(--red)',
};

export default Tag;
