#!/usr/bin/env node
import getMAC from './'
import { networkInterfaces } from 'os'
try {
	console.log(getMAC(process.argv[2]))
} catch (err) {
	console.error(networkInterfaces())
	throw err
}
