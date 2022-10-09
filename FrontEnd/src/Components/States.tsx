import { createContext } from 'react';
const States = createContext({
	isLoggedIn: false,
	setIsLoggedIn: (isLoggedIn: boolean) => {},
	userEmail: '',
	setUserEmail: (userEmail: string) => {},
	userID: '',
	setUserID: (userID: string) => {},
	userUsername: '',
	setUserUsername: (userUsername: string) => {},
	userToken: '',
	setUserToken: (userToken: string) => {},
	isAdmin: false,
	setIsAdmin: (isAdmin: boolean) => {},
});

export default States;
