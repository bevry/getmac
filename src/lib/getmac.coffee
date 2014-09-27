# Import
{exec} = require('child_process')
{extractOpts} = require('extract-opts')

# Prepare
isWindows = process.platform.indexOf('win') is 0
winRegex = /((?:[a-f0-9]{2}[:\-]){5}[a-f0-9]{2})\s+(\S+)/ig
theRegex = /^(\S+)?\s+.*\s+((?:[a-f0-9]{2}[:\-]){5}[a-f0-9]{2})/ig
macRegex = /(?:[a-f0-9]{2}[:\-]){5}[a-f0-9]{2}/ig

# Get Mac
# next(err,macAddress)
getMac = (opts, next) ->
	# Prepare
	[opts, next] = extractOpts(opts, next)
	{data} = opts
	iface = opts.interface
	data ?= null

	# Command
	command = if isWindows then "getmac" else "ifconfig"

	# Extract Mac
	extractMac = (data, next) ->
		# Prepare
		macs = {}

		data = data.split("\n")
		# Find a valid mac address
		if /^\S+:/.exec(data[0])
			while data.length
				line = data.shift()
				name = /^\S+:/.exec(line)
				if name
					line = data.shift()
					result = macRegex.exec(line)
					if result
						macs[name] = result[0]
		else
			while data.length
				line = data.shift()
				if isWindows
					match = winRegex.exec(line)
					if match
						mac = match[1].split(/[:\-]/).join(':')
						macs[match[2]] = mac
				else
					match = theRegex.exec(line)
					if match
						mac = match[2].split(/[:\-]/).join(':')
						macs[match[1]] = mac
			#macAddress = match[0]

		# We have no mac address so return an error
		keys = Object.keys(macs)
		if keys.length is 0
			err = new Error('could not determine the mac address from:\n'+data)
			return next(err)

		# Forward with result
		if not iface
			return next(null, macs[keys[0]])
		else
			return next(null, macs[iface])

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
