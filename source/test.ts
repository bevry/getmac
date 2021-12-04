// Import
import kava from 'kava'
import { equal } from 'assert-helpers'
import getMAC, { isMAC } from './index.js'

function mockNetworkInterfaces(mac: string) {
	const os = require('os')
	const actual = os.networkInterfaces
	os.networkInterfaces = function () {
		return {
			en0: [
				{
					mac,
				},
			],
		}
	}
	const restore = () => (os.networkInterfaces = actual)
	return restore
}

// Test
kava.suite('getMAC', function (suite, test) {
	suite('validation', function (suite, test) {
		test('validates coloned mac correctly', function () {
			equal(isMAC('e4:ce:8f:5b:a7:fe'), true)
		})

		test('validated capital mac correctly', function () {
			equal(isMAC('00:28:31:8A:41:C6'), true)
		})

		test('validates dashed mac correctly', function () {
			equal(isMAC('e4-ce-8f-5b-a7-fe'), true)
		})

		test('validates non-mac correctly', function () {
			equal(isMAC('e4:ce:8f:5b:a7fe'), false)
		})

		test('validates single char parts correctly', function () {
			equal(isMAC('e4:ce:8f:5b:a:e'), true)
			equal(isMAC('00:28:31:8A:1:6'), true)
			equal(isMAC('e4-ce-8f-5b-7-e'), true)
		})
	})

	test('got the first MAC address successfully', function () {
		const macAddress = getMAC()
		console.log(macAddress)
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
	})

	test('returns mac', function () {
		const mockedMacAddress = '01-23-45-67-89-AB-CD-EF'
		const restore = mockNetworkInterfaces(mockedMacAddress)
		const macAddress = getMAC()
		equal(macAddress, mockedMacAddress)
		restore()
	})
})
