# Import
{exec} = require('child_process')
{extractOpts} = require('extract-opts')

# Prepare
winRegex = /((?:[a-f0-9]{2}[:\-]){5}[a-f0-9]{2})\s+(\S+)/ig
theRegex = /^(\S+)?\s+.*\s+((?:[a-f0-9]{2}[:\-]){5}[a-f0-9]{2})/ig
macRegex = /(?:[a-f0-9]{2}[:\-]){5}[a-f0-9]{2}/ig

# Get Mac
# next(err,macAddress)
getMac = (opts, next) ->
	# Prepare
	[opts, next] = extractOpts(opts, next)
	iface = opts.interface
	isWindows = process.platform.indexOf('win') is 0
	if opts.os
		isWindows = opts.os is 'win'
	{data} = opts
	data ?= null

	# Command
	command = if isWindows then "getmac" else "ifconfig"

	# Extract Mac
	extractMac = (data, next) ->
		# Prepare
		macs = {}
		firstMac = null

		d = data.split("\n")
		# Find a valid mac address
		if /^\S+:/.exec(data[0])
			while d.length
				line = d.shift()
				name = /^\S+:/.exec(line)
				if name
					line = d.shift()
					result = macRegex.exec(line)
					if result
						mac = macs[name] = result[0].toLowerCase()
						if not firstMac
							firstMac = macs
		else
			while d.length
				line = d.shift()
				if isWindows
					match = winRegex.exec(line)
					if match
						mac = match[1].split(/[:\-]/).join(':').toLowerCase()
						macs[match[2]] = mac
						if not firstMac
							firstMac = mac
				else
					match = theRegex.exec(line)
					if match
						mac = match[2].split(/[:\-]/).join(':').toLowerCase()
						macs[match[1]] = mac
						if not firstMac
							firstMac = mac
			#macAddress = match[0]

		# We have no mac address so return an error
		if not firstMac
			err = new Error('could not determine the mac address from:\n'+data)
			return next(err)

		# Forward with result
		if not iface
			return next(null, firstMac)
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
