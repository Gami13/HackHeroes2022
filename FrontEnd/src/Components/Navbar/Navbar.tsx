import { useRef, useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import style from './Navbar.module.css';

// import { ReactComponent as Test } from '../../assets/svgs/check-circle-fill.svg';

const NavBarButton = (props: {
	to: string;
	children?: any;
	title: string;
	className?: string;
}) => {
	return (
		<li className={props.className}>
			<Link to={props.to}>
				{props.children}
				{props.title}
			</Link>
		</li>
	);
};

const Navbar = () => {
	const [isShown, setIsShown] = useState(false);
	function show() {
		setIsShown(!isShown);
	}

	const menu: any = useRef(null);

	const closeOpenMenus = (e: any) => {
		if (menu.current && isShown && !menu.current.contains(e.target)) {
			setIsShown(false);
		}
	};
	document.addEventListener('mousedown', closeOpenMenus);

	return (
		<header className={style.navWrapper}>
			<button onClick={show} title="Show Menu" className={style.showNav}>
				<svg
					version="1.1"
					id="Capa_1"
					x="0px"
					y="0px"
					viewBox="0 0 512 512"
					width="512"
					height="512"
				>
					<g>
						<path d="M480,224H32c-17.673,0-32,14.327-32,32s14.327,32,32,32h448c17.673,0,32-14.327,32-32S497.673,224,480,224z" />
						<path d="M32,138.667h448c17.673,0,32-14.327,32-32s-14.327-32-32-32H32c-17.673,0-32,14.327-32,32S14.327,138.667,32,138.667z" />
						<path d="M480,373.333H32c-17.673,0-32,14.327-32,32s14.327,32,32,32h448c17.673,0,32-14.327,32-32S497.673,373.333,480,373.333z" />
					</g>
				</svg>
			</button>

			<nav
				ref={menu}
				className={`${style.nav} ${isShown ? style.showMenu : null}`}
			>
				<ul>
					<NavBarButton to="/" title="Obywatel++" className="title">
						{/* TODO:Mozna dac SVG */}
					</NavBarButton>
					<NavBarButton to="/" title="Głowna">
						<svg
							xmlns="http://www.w3.org/2000/svg"
							id="Capa_1"
							x="0px"
							y="0px"
							viewBox="0 0 512 512"
							width="512"
							height="512"
						>
							<g>
								<path d="M256,319.841c-35.346,0-64,28.654-64,64v128h128v-128C320,348.495,291.346,319.841,256,319.841z" />
								<g>
									<path d="M362.667,383.841v128H448c35.346,0,64-28.654,64-64V253.26c0.005-11.083-4.302-21.733-12.011-29.696l-181.29-195.99    c-31.988-34.61-85.976-36.735-120.586-4.747c-1.644,1.52-3.228,3.103-4.747,4.747L12.395,223.5    C4.453,231.496-0.003,242.31,0,253.58v194.261c0,35.346,28.654,64,64,64h85.333v-128c0.399-58.172,47.366-105.676,104.073-107.044    C312.01,275.383,362.22,323.696,362.667,383.841z" />
									<path d="M256,319.841c-35.346,0-64,28.654-64,64v128h128v-128C320,348.495,291.346,319.841,256,319.841z" />
								</g>
							</g>
						</svg>
					</NavBarButton>
					<NavBarButton to="/reminder" title="Przypominajka">
						{/* <Test /> */}
						<svg
							xmlns="http://www.w3.org/2000/svg"
							fill="none"
							viewBox="0 0 24 24"
							strokeWidth="1.5"
							width="512"
							height="512"
						>
							<path
								strokeLinecap="round"
								strokeLinejoin="round"
								d="M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118 9.75v-.7V9A6 6 0 006 9v.75a8.967 8.967 0 01-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0"
							/>
						</svg>
					</NavBarButton>
					<NavBarButton to="/logout" title="Wyloguj">
						<svg
							xmlns="http://www.w3.org/2000/svg"
							id="Capa_1"
							x="0px"
							y="0px"
							viewBox="0 0 512 512"
							width="512"
							height="512"
						>
							<g>
								<path d="M170.698,448H72.757c-4.814-0.012-8.714-3.911-8.725-8.725V72.725c0.012-4.814,3.911-8.714,8.725-8.725h97.941   c17.673,0,32-14.327,32-32s-14.327-32-32-32H72.757C32.611,0.047,0.079,32.58,0.032,72.725v366.549   C0.079,479.42,32.611,511.953,72.757,512h97.941c17.673,0,32-14.327,32-32S188.371,448,170.698,448z" />
								<path d="M483.914,188.117l-82.816-82.752c-12.501-12.495-32.764-12.49-45.259,0.011s-12.49,32.764,0.011,45.259l72.789,72.768   L138.698,224c-17.673,0-32,14.327-32,32s14.327,32,32,32l0,0l291.115-0.533l-73.963,73.963   c-12.042,12.936-11.317,33.184,1.618,45.226c12.295,11.445,31.346,11.436,43.63-0.021l82.752-82.752   c37.491-37.49,37.491-98.274,0.001-135.764c0,0-0.001-0.001-0.001-0.001L483.914,188.117z" />
							</g>
						</svg>
					</NavBarButton>
					<NavBarButton to="/register" title="Zarejestruj">
						<svg
							id="Layer_1"
							height="512"
							viewBox="0 0 24 24"
							width="512"
							xmlns="http://www.w3.org/2000/svg"
							data-name="Layer 1"
						>
							<path d="m15.989 12.7v-2.7a1 1 0 0 1 1-1h1a1 1 0 0 0 1-1v-1a1 1 0 0 1 1-1h2.685a1.016 1.016 0 0 0 .922-.6 4.522 4.522 0 0 0 .376-2.377 3.491 3.491 0 0 0 -3.506-3.023 4.537 4.537 0 0 0 -3.208 1.329l-7.908 7.906a7.368 7.368 0 0 0 -3.881.048 7.5 7.5 0 0 0 2.036 14.717 7.654 7.654 0 0 0 .784-.041 7.529 7.529 0 0 0 6.428-5.429 7.334 7.334 0 0 0 .047-3.88l.65-.65a1.984 1.984 0 0 0 .575-1.3zm-10.489 7.3a1.5 1.5 0 1 1 1.5-1.5 1.5 1.5 0 0 1 -1.5 1.5z" />
						</svg>
					</NavBarButton>
					<NavBarButton to="/login" title="Zaloguj">
						<svg
							id="Layer_1"
							height="512"
							viewBox="0 0 24 24"
							width="512"
							xmlns="http://www.w3.org/2000/svg"
							data-name="Layer 1"
						>
							<path d="m15.989 12.7v-2.7a1 1 0 0 1 1-1h1a1 1 0 0 0 1-1v-1a1 1 0 0 1 1-1h2.685a1.016 1.016 0 0 0 .922-.6 4.522 4.522 0 0 0 .376-2.377 3.491 3.491 0 0 0 -3.506-3.023 4.537 4.537 0 0 0 -3.208 1.329l-7.908 7.906a7.368 7.368 0 0 0 -3.881.048 7.5 7.5 0 0 0 2.036 14.717 7.654 7.654 0 0 0 .784-.041 7.529 7.529 0 0 0 6.428-5.429 7.334 7.334 0 0 0 .047-3.88l.65-.65a1.984 1.984 0 0 0 .575-1.3zm-10.489 7.3a1.5 1.5 0 1 1 1.5-1.5 1.5 1.5 0 0 1 -1.5 1.5z" />
						</svg>
					</NavBarButton>
				</ul>
			</nav>
		</header>
	);
};
export default Navbar;
