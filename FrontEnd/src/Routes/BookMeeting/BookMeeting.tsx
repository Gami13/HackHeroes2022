import { useContext, useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import style from './BookMeeting.module.css';
import States from '../../Components/States';
import PersonCard from '../../Components/PersonCard/PersonCard';

const BookMeeting = () => {
	function come() {
		alert('please come in');
	}
	const context = useContext(States);
	return (
		<div className={style.bookMeeting}>
			<h1>Book Meeting</h1>
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
			<PersonCard
				image="https://api.time.com/wp-content/uploads/2014/07/301386_full1.jpg"
				name="Harry Potter"
				position="Wójt"
				description="Cześć :) jestem super wójtem i mieszkam w twoich ścianach 🙃 i wiem co robisz po nocach 😈"
				voivodeship="Małopolska"
				county="Gorlicki"
				town="Gorlice"
				action={come}
			/>{' '}
		</div>
	);
};
export default BookMeeting;
