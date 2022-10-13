import Cookies from 'js-cookie';

function getCookie(name: string) {
	let cookie = Cookies.get('token');
	if (!cookie) {
		return undefined;
	}
	let data;
	try {
		data = JSON.parse(
			Buffer.from(cookie as string, 'base64').toString('utf-8')
		);
	} catch (error) {
		data = undefined;
		Cookies.remove('token');
		return;
	}
	return data;
}
function setCookie(json: Object) {
	Cookies.set(
		'token',
		Buffer.from(JSON.stringify(json), 'utf-8').toString('base64'),
		{ expires: 7 }
	);
}
export { getCookie, setCookie };
