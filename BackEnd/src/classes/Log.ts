declare global {
	interface Console {
		green(...data: any[]): void;
		red(...data: any[]): void;
		yellow(...data: any[]): void;
		blue(...data: any[]): void;
		magenta(...data: any[]): void;
		cyan(...data: any[]): void;
		white(...data: any[]): void;
		black(...data: any[]): void;
	}
}

class Log {
	/* 	Reset = "\x1b[0m"
	Bright = "\x1b[1m"
	Dim = "\x1b[2m"
	Underscore = "\x1b[4m"
	Blink = "\x1b[5m"
	Reverse = "\x1b[7m"
	Hidden = "\x1b[8m"
	
	FgBlack = "\x1b[30m"
	FgRed = "\x1b[31m"
	FgGreen = "\x1b[32m"
	FgYellow = "\x1b[33m"
	FgBlue = "\x1b[34m"
	FgMagenta = "\x1b[35m"
	FgCyan = "\x1b[36m"
	FgWhite = "\x1b[37m"
	
	BgBlack = "\x1b[40m"
	BgRed = "\x1b[41m"
	BgGreen = "\x1b[42m"
	BgYellow = "\x1b[43m"
	BgBlue = "\x1b[44m"
	BgMagenta = "\x1b[45m"
	BgCyan = "\x1b[46m"
	BgWhite = "\x1b[47m" */
	static green(message: string) {
		console.log("\x1b[32m", message, "\x1b[0m");
	}
	static red(message: string) {
		console.log("\x1b[31m", message, "\x1b[0m");
	}
	static yellow(message: string) {
		console.log("\x1b[33m", message, "\x1b[0m");
	}
	static blue(message: string) {
		console.log("\x1b[34m", message, "\x1b[0m");
	}
	static magenta(message: string) {
		console.log("\x1b[35m", message, "\x1b[0m");
	}
	static cyan(message: string) {
		console.log("\x1b[36m", message, "\x1b[0m");
	}
	static white(message: string) {
		console.log("\x1b[37m", message, "\x1b[0m");
	}
	static black(message: string) {
		console.log("\x1b[30m", message, "\x1b[0m");
	}
}

export function yes() {
	Object.setPrototypeOf(console, Log);
}
export default Log;
