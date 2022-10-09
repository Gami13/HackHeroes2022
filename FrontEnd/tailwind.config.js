/** @type {import('tailwindcss').Config} */
module.exports = {
	content: ['./src/**/*.{js,jsx,ts,tsx,html}'],
	theme: {
		extend: {
			colors: {
				accent: '#5865f2',
				depth0: '#202225',
				depth1: '#2f3136',
				depth2: '#36393f',
				text: '#BBC5D0',
				textGold: '#D0B178',
				rred: '#d83c3e',
				focusedRed: '#a12d2f',
			},
			spacing: {
				1.25: '0.3125rem',
				1.5: '0.375rem',
				1.75: '0.4375rem',
				116: '29rem',
			},
		},

		screens: {
			medium: '900px',
		},
	},
	plugins: [],
};
