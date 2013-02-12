# Import
exec = require('child_process').exec

# Prepare
isWindows = process.platform.indexOf('win') is 0
macRegex = /(?:[a-z0-9]{1,2}[:\-]){5}[a-z0-9]{1,2}/i

# Get Mac
# next(err,macAddress)
getBigMac = getMac = (next) ->
	# Windows
	if isWindows
		command = "getmac"
		exec command, (err,stdout,stderr) ->
			return next(err)  if err
			macAddress = stdout.match(macRegex)[0]
			return next(null,macAddress)

	# Unix
	else
		command = "ifconfig"
		exec command, (err,stdout,stderr) ->
			return next(err)  if err
			console.log stdout
			macAddress = stdout.match(macRegex)[0]
			return next(null,macAddress)

# Is Mac
isMac = (macAddress) ->
	return String(macAddress).match(macRegex)?.length is 1

# Export
module.exports = {macRegex,getMac,getBigMac,isMac}