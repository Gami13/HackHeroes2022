import { useRef, useEffect, useState, useContext } from 'react';
import { Link, useMatch, useResolvedPath } from 'react-router-dom';

import style from './Navbar.module.css';
import States from '../States';
// import { ReactComponent as Test } from '../../assets/svgs/check-circle-fill.svg';

const NavBarButton = (props: {
	to: string;
	children?: any;
	title: string;
	className?: string;
}) => {
	const resolvedPath = useResolvedPath(props.to);
	const isActive = useMatch({ path: resolvedPath.pathname, end: true });
	return (
		<li className={props.className}>
			<Link to={props.to}>
				{props.children}
				{props.title}
			</Link>
			<span className={isActive ? style.onPage : null}></span>
		</li>
	);
};

const Navbar = () => {
	const states = useContext(States);
	const [isShown, setIsShown] = useState(false);
	function show() {
		setIsShown(!isShown);
		console.log('negate');
	}

	const menu: any = useRef(null);
	const menuBtn: any = useRef(null);

	const closeOpenMenus = (e: any) => {
		if (
			menu.current &&
			isShown &&
			!menu.current.contains(e.target) &&
			!menuBtn.current.contains(e.target)
		) {
			setIsShown(false);
			console.log('close');
		}
	};
	document.addEventListener('mousedown', closeOpenMenus);

	return (
		<header className={style.navWrapper}>
			<button
				ref={menuBtn}
				onClick={show}
				title="Show Menu"
				className={style.showNav}
			>
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
					<NavBarButton to="/mail" title="Mailbox">
						<svg
							xmlns="http://www.w3.org/2000/svg"
							width="16"
							height="16"
							viewBox="0 0 16 16"
							strokeWidth={0}
						>
							<path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
						</svg>
					</NavBarButton>
					<NavBarButton to="/bookMeeting" title="Umów spotkanie">
						<svg
							version="1.1"
							xmlns="http://www.w3.org/2000/svg"
							x="0px"
							y="0px"
							viewBox="0 0 1000 1000"
							enableBackground="new 0 0 1000 1000"
						>
							<g>
								<g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)">
									<path d="M1403.1,120v-4905.7h3455.1c3813.5,0,3595-5.8,3842.2,124.6c266.4,139.9,473.3,389,573,686c46,143.7,51.7,187.8,59.4,527l7.7,367.9h-375.6h-375.6v-185.9c-1.9-410.1-132.2-741.6-400.5-1011.8c-70.9-72.8-174.4-149.5-251-189.7c-208.9-109.2-312.4-126.5-827.9-126.5h-454.2l159.1,159c128.4,126.5,174.4,189.7,237.6,320c147.6,302.8,138,15.3,138,4235c0,4221.6,9.6,3926.5-138,4235c-63.2,130.3-109.2,193.5-235.7,321.9l-157.1,157.1h461.8c507.8,0,594.1-11.5,793.3-113.1c233.8-116.9,413.9-312.4,540.4-586.4c141.8-300.9,134.1-141.8,134.1-2930c0-2489.3,0-2502.7,38.3-2504.6c21.1-1.9,145.6-1.9,277.9-1.9s283.6,0,335.4,1.9l95.8,1.9l-3.8,2688.6l-5.7,2686.7l-51.7,139.9c-136.1,371.8-385.2,632.4-728.2,755l-120.7,44.1l-3510.7,5.7l-3512.6,3.8V120z M5810.6,2371.7v-239.5H4248.8H2687v239.5v239.5h1561.8h1561.8V2371.7z M5810.6,1059V541.6H4248.8H2687V1059v517.4h1561.8h1561.8V1059z" />
									<path d="M780.3,4922.3c-318.1-149.5-548.1-438.8-643.9-810.6C100,3969.9,100,3866.4,100,120s0-3849.9,36.4-3991.7c47.9-185.9,115-327.7,228-475.2c115-153.3,341.1-322,496.3-369.9l44.1-13.4V118.1c0,2667.5-5.7,4850.2-13.4,4850.2C881.9,4968.3,833.9,4947.2,780.3,4922.3z" />
									<path d="M7562.1,3688.2c-65.2-42.2-65.2-59.4-65.2-3573.9v-3476.2l40.2-51.7c47.9-59.4,116.9-65.1,170.6-11.5c38.3,38.3,38.3,63.2,38.3,3545.2s0,3506.8-38.3,3545.2C7669.4,3703.5,7600.4,3715,7562.1,3688.2z" />
									<path d="M8054.6,3653.7c-40.2-51.7-40.2-51.7-40.2-2500.8v-2451h124.6h124.6v2462.5c0,2437.5,0,2462.5-38.3,2500.8C8171.5,3718.8,8102.5,3713.1,8054.6,3653.7z" />
									<path d="M8022-1575.9c-5.8-11.5-5.8-295.1-3.8-632.4l5.7-613.2l935.2-5.7c513.6-1.9,933.2,0,933.2,5.7s-111.1,153.3-249.1,327.7L9396-2175.7l203.1,253c111.1,138,226.1,274,252.9,304.7l47.9,51.7l-115,1.9C9120.1-1552.9,8027.8-1560.6,8022-1575.9z" />
									<path d="M8014.3-3222c0-161,42.2-241.4,126.5-241.4c90.1,0,122.7,59.4,122.7,230v153.3h-124.6h-124.6V-3222z" />
								</g>
							</g>
						</svg>
					</NavBarButton>
					<NavBarButton to="/reminder" title="Kalendarz">
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
					{states.isLoggedIn ? (
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
					) : null}
					{states.isLoggedIn ? null : (
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
					)}
					{states.isLoggedIn ? null : (
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
					)}
				</ul>
			</nav>
		</header>
	);
};
export default Navbar;
