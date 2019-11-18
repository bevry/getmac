// Import
import kava from 'kava'
import { equal } from 'assert-helpers'
import getMAC, { extractMAC, isMAC } from './'
import { readFileSync } from 'fs'

const fixtures = {
	ipconfig: readFileSync(`${__dirname}/../fixtures/ipconfig.txt`, {
		encoding: 'utf8'
	}),
	ifconfig: readFileSync(`${__dirname}/../fixtures/ifconfig.txt`, {
		encoding: 'utf8'
	}),
	iplink: readFileSync(`${__dirname}/../fixtures/iplink.txt`, {
		encoding: 'utf8'
	})
}

// Test
kava.suite('getMAC', function(suite) {
	suite('validation', function(suite, test) {
		test('validates dashed mac correctly', function() {
			equal(isMAC('e4:ce:8f:5b:a7:fe'), true)
		})

		test('validated capital mac correctly', function() {
			equal(isMAC('00:28:31:8A:41:C6'), true)
		})

		test('validates coloned mac correctly', function() {
			equal(isMAC('e4-ce-8f-5b-a7-fe'), true)
		})

		test('validates non-mac correctly', function() {
			equal(isMAC('e4:ce:8f:5b:a7fe'), false)
		})

		suite('preset ipconfig', function(suite, test) {
			test('got the default mac address successfully', function() {
				const macAddress = extractMAC(fixtures.ipconfig)
				equal(macAddress, '00:18:31:8A:41:C6')
			})

			test('got the mac address of eth0 successfully', function() {
				const macAddress = extractMAC(fixtures.ipconfig, 'eth0')
				equal(macAddress, '00:18:31:8A:41:C6')
			})
		})
	})

	suite('preset ifconfig', function(suite, test) {
		test('got the default mac address successfully', function() {
			const macAddress = extractMAC(fixtures.ifconfig)
			equal(macAddress, 'b8:8d:12:07:6b:ac')
		})

		test('got the mac address of p2p0 successfully', function() {
			const macAddress = extractMAC(fixtures.ifconfig, 'p2p0')
			equal(macAddress, '0a:8d:12:07:6a:bc')
		})
	})

	suite('preset ip link', function(suite, test) {
		test('got the default mac address successfully', function() {
			const macAddress = extractMAC(fixtures.iplink)
			equal(macAddress, 'bc:76:4e:20:7d:dd')
		})

		test('got the mac address of eth1 successfully', function() {
			const macAddress = extractMAC(fixtures.iplink, 'eth1')
			equal(macAddress, 'bc:76:4e:20:99:be')
		})
	})

	suite('system', function(suite, test) {
		test('got the default mac address successfully', async function(done) {
			const macAddress = await getMAC()
			equal(
				macAddress === '00-00-00-00-00-00',
				false,
				`${macAddress} not 00-00-00-00-00-00`
			)
			equal(
				macAddress === '00:00:00:00:00:00',
				false,
				`${macAddress} not 00:00:00:00:00:00`
			)
			equal(typeof macAddress, 'string', `${macAddress} is string`)
			equal(isMAC(macAddress), true, `${macAddress} is mac address`)
			done()
		})
	})
})
