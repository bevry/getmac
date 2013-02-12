# Import
joe = require('joe')
{expect} = require('chai')
{getMac,isMac,macRegex} = require('../lib/getmac')


# Test
joe.describe 'getmac', (describe,it) ->
	it 'got the mac address successfully', ->
		getMac (err,macAddress) ->
			expect(err).to.be.null
			expect(macAddress).to.be.string
			expect(isMac macAddress).to.be.true
			console.log('Got:', macAddress)

	it 'validates mac correctly', ->
		expect(isMac 'e4:ce:8f:5b:a7:fe').to.be.true

	it 'validates non-mac correctly', ->
		expect(isMac 'e4:ce:8f:5b:a7fe').to.be.false
