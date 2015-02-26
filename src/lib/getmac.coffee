# Import
{exec} = require('child_process')
{extractOpts} = require('extract-opts')

# Prepare
isWindows = process.platform.indexOf('win') is 0
macRegex = /(?:[a-z0-9]{2}[:\-]){5}[a-z0-9]{2}/ig
zeroRegex = /(?:[0]{2}[:\-]){5}[0]{2}/

# Get Mac
# next(err,macAddress)
getMac = (opts, next) ->
	# Prepare
	[opts, next] = extractOpts(opts, next)
	{data} = opts
	data ?= null

	# Command
	command = if isWindows then "getmac" else "ifconfig || ip link"

	# Extract Mac
	extractMac = (data, next) ->
		# Prepare
		result = null

		# Find a valid mac address
		while match = macRegex.exec(data)
			macAddress = match[0]
			isZero = zeroRegex.test(macAddress)
			if isZero is false
				result ?= macAddress

		# We have no mac address so return an error
		if result is null
			err = new Error('could not determine the mac address from:\n'+data)
			return next(err)

		# Forward with result
		return next(null, result)

	# If we already have data go straight to extracting the mac
	if data
		return extractMac(data, next)

	# Otherwise fetch the data first
	else
		exec command, (err, stdout, stderr) ->
			# Exit if error
			return next(err)  if err

			# Otherwise forward
			return extractMac(stdout, next)

# Is Mac
isMac = (macAddress) ->
	return String(macAddress).match(macRegex)?.length is 1

# Export
module.exports = {macRegex,getMac,isMac}
