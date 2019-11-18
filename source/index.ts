// Import
import { exec } from 'child_process'

// Prepare
const isWindows = process.platform.startsWith('win')
const macRegex = /(?:[a-z0-9]{2}[:-]){5}[a-z0-9]{2}/gi
const zeroRegex = /(?:[0]{2}[:-]){5}[0]{2}/

// Helpers
function asyncExec(command: string): Promise<string> {
	return new Promise(function(resolve, reject) {
		exec(command, function(err, stdout, stderr) {
			if (err) return reject(err)
			resolve(stdout)
		})
	})
}

/** Extract Interface */
function extractInterface(iface: string, input: string) {
	const ifaceRegExp = new RegExp(`${iface}[:\\s]`)
	const lines = input.split(/\r?\n/g)
	let result = ''
	let padding

	for (const line of lines) {
		if (result === '') {
			if (ifaceRegExp.test(line)) {
				result += line
			}
			continue
		} else if (padding == null) {
			const match = /^(\s+)/.exec(line)
			if (match) {
				result += '\n' + line
				padding = new RegExp(`^${match[1]}`)
				continue
			}
		} else {
			const match = padding.exec(line)
			if (match) {
				result += '\n' + line
				continue
			}
		}
		break
	}

	if (result === '') {
		throw new Error(`Failed to extract the interface ${iface} from\n${input}`)
	}

	return result
}

/** Extract the MAC address from a string */
export function extractMAC(input: string, iface?: string): string {
	// Prepare
	if (iface) {
		input = extractInterface(iface, input)
	}

	// Find a valid mac address
	macRegex.lastIndex = 0 // reset
	let match: RegExpExecArray | null
	/* eslint no-cond-assign:0 */
	while ((match = macRegex.exec(input))) {
		const macAddress = match[0]
		const isZero = zeroRegex.test(macAddress)
		if (isZero === false) {
			return macAddress
		}
	}

	// We have no mac address so return an error
	throw new Error(`Failed to extract the MAC address from\n${input}`)
}

/** Get the first proper MAC address */
export default async function getMAC(iface?: string): Promise<string> {
	const command = isWindows
		? '%SystemRoot%/System32/getmac.exe'
		: '/sbin/ifconfig -a || /sbin/ip link'
	const stdout = await asyncExec(command)
	return extractMAC(stdout, iface)
}

// Is Mac
export function isMAC(macAddress: string) {
	macRegex.lastIndex = 0 // reset
	return String(macAddress).match(macRegex)?.length === 1
}
