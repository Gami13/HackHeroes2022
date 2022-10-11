import { createContext, Dispatch } from 'react';
interface StatesA {
	isLoggedIn: boolean;
	setIsLoggedIn: Dispatch<boolean>;
	userEmail: string;
	setUserEmail: (userEmail: string) => void;
	userID: string;
	setUserID: (userID: string) => void;
	userFirstName: string;
	setUserFirstName: (userFirstName: string) => void;
	userLastName: string;
	setUserLastName: (userLastName: string) => void;
	userToken: string;
	setUserToken: (userToken: string) => void;
	userRanks: string[];
	setUserRanks: (userRanks: string[]) => void;
}
const States = createContext({
	isLoggedIn: false,
	setIsLoggedIn: (isLoggedIn: boolean) => {},
	userEmail: '',
	setUserEmail: (userEmail: string) => {},
	userID: '',
	setUserID: (userID: string) => {},
	userFirstName: '',
	setUserFirstName: (userFirstName: string) => {},
	userLastName: '',
	setUserLastName: (userLastName: string) => {},
	userToken: '',
	setUserToken: (userToken: string) => {},
	userRanks: [],
	setUserRanks: (userRanks: string[]) => {},
} as StatesA);
export default States;
