# Import
exec = require('child_process').exec

# Prepare
isWindows = process.platform.indexOf('win') is 0
macRegex = /(?:[a-z0-9]{1,2}:){5}[a-z0-9]{1,2}/

# Get Mac
# next(err,macAddress)
getBigMac = getMac = (next) ->
	# Windows
	if process.platform.indexOf('win') is 0
		command = "ipconfig /all"
		exec command, (err,stdout,stderr) ->
			return next(err)  if err
			macAddress = stdout.match(macRegex)[0]
			return next(null,macAddress)

	# Unix
	else
		command = "ifconfig | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'"
		exec command, (err,stdout,stderr) ->
			return next(err)  if err
			macAddress = stdout.split('\n')[0]
			return next(null,macAddress)

# Is Mac
isMac = (macAddress) ->
	return String(macAddress).match(macRegex)?.length is 1

# Export
module.exports = {macRegex,getMac,getBigMac,isMac}