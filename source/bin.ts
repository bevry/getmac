#!/usr/bin/env node
import getMAC from './'
getMAC()
	.catch(console.error)
	.then(console.log)
