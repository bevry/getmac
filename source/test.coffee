# Import
joe = require('joe')
{equal, errorEqual} = require('assert-helpers')
{getMac,isMac,macRegex} = require('../')

# Test
joe.describe 'getmac', (describe,it) ->
	describe 'validation', (describe,it) ->
		it 'validates dashed mac correctly', ->
			equal(isMac('e4:ce:8f:5b:a7:fe'), true)

		it 'validates coloned mac correctly', ->
			equal(isMac('e4-ce-8f-5b-a7-fe'), true)

		it 'validates non-mac correctly', ->
			equal(isMac('e4:ce:8f:5b:a7fe'), false)

	describe 'preset ipconfig', (describe,it) ->
		data = """
			can0      Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
			          UP RUNNING NOARP  MTU:16  Metric:1
			          RX packets:282 errors:0 dropped:0 overruns:0 frame:0
			          TX packets:2909 errors:0 dropped:0 overruns:0 carrier:0
			          collisions:0 txqueuelen:10
			          RX bytes:1975 (1.9 KiB)  TX bytes:20083 (19.6 KiB)
			          Interrupt:55

			eth0      Link encap:Ethernet  HWaddr 00:18:31:8A:41:C6
			          inet addr:10.42.193.19  Bcast:10.42.193.255  Mask:255.255.255.0
			          inet6 addr: fe80::218:31ff:fe8a:41c6/64 Scope:Link
			          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
			          RX packets:305126 errors:0 dropped:12547 overruns:0 frame:0
			          TX packets:49447 errors:0 dropped:0 overruns:0 carrier:0
			          collisions:0 txqueuelen:1000
			          RX bytes:63758575 (60.8 MiB)  TX bytes:4862291 (4.6 MiB)

			lo        Link encap:Local Loopback
			          inet addr:127.0.0.1  Mask:255.0.0.0
			          inet6 addr: ::1/128 Scope:Host
			          UP LOOPBACK RUNNING  MTU:16436  Metric:1
			          RX packets:2404 errors:0 dropped:0 overruns:0 frame:0
			          TX packets:2404 errors:0 dropped:0 overruns:0 carrier:0
			          collisions:0 txqueuelen:0
		  RX bytes:230580 (225.1 KiB)  TX bytes:230580 (225.1 KiB)
		  """

		it 'got the default mac address successfully', (done) ->
			getMac {data}, (err, macAddress) ->
				return done(err)  if err
				errorEqual(err, null)
				equal(macAddress, '00:18:31:8A:41:C6')
				return done()

		it 'got the mac address of eth0 successfully', (done) ->
			getMac {data, iface: 'eth0'}, (err, macAddress) ->
				return done(err) if err
				errorEqual(err, null)
				equal(macAddress, '00:18:31:8A:41:C6')
				return done()

	describe 'preset ifconfig', (describe,it) ->
		data = """
			lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384
				options=3<RXCSUM,TXCSUM>
				inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1
				inet 127.0.0.1 netmask 0xff000000
				inet6 ::1 prefixlen 128
			gif0: flags=8010<POINTOPOINT,MULTICAST> mtu 1280
			stf0: flags=0<> mtu 1280
			en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
				ether b8:8d:12:07:6b:ac
				inet6 fe80::ba8d:12ff:fc07:6aac%en0 prefixlen 64 scopeid 0x4
				inet 10.1.1.104 netmask 0xffffff00 broadcast 10.1.1.255
				media: autoselect
				status: active
			p2p0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 2304
				ether 0a:8d:12:07:6a:bc
				media: autoselect
				status: inactive
			utun0: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380
				inet6 fe80::a1ac:4a2:5287:ac68%utun0 prefixlen 64 scopeid 0x6
				inet6 fd3b:93f0:b200:5fe1:a1ae:4a2:5287:ae68 prefixlen 64
		  """

		it 'got the default mac address successfully', (done) ->
			getMac {data}, (err, macAddress) ->
				return done(err)  if err
				errorEqual(err, null)
				equal(macAddress, 'b8:8d:12:07:6b:ac')
				return done()

		it 'got the mac address of p2p0 successfully', (done) ->
			getMac {data, iface: 'p2p0'}, (err, macAddress) ->
				return done(err)  if err
				errorEqual(err, null)
				equal(macAddress, '0a:8d:12:07:6a:bc')
				return done()

	describe 'preset ip link', (describe,it) ->
		data = """
			1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default
			    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
			2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
			    link/ether bc:76:4e:20:7d:dd brd ff:ff:ff:ff:ff:ff
			3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
			    link/ether bc:76:4e:20:99:be brd ff:ff:ff:ff:ff:ff
			4: sit0@NONE: <NOARP> mtu 1480 qdisc noop state DOWN mode DEFAULT group default
			    link/sit 0.0.0.0 brd 0.0.0.0
		  """

		it 'got the default mac address successfully', (done) ->
			getMac {data}, (err, macAddress) ->
				return done(err)  if err
				errorEqual(err, null)
				equal(macAddress, 'bc:76:4e:20:7d:dd')
				return done()

		it 'got the mac address of eth1 successfully', (done) ->
			getMac {data, iface: 'eth1'}, (err, macAddress) ->
				return done(err)  if err
				errorEqual(err, null)
				equal(macAddress, 'bc:76:4e:20:99:be')
				return done()

	describe 'system', (describe,it) ->
		it 'got the default mac address successfully', (done) ->
			getMac (err, macAddress) ->
				return done(err)  if err
				errorEqual(err, null)
				equal(
					macAddress is '00-00-00-00-00-00',
					false,
					"#{macAddress} not 00-00-00-00-00-00"
				)
				equal(
					macAddress is '00:00:00:00:00:00',
					false,
					"#{macAddress} not 00:00:00:00:00:00"
				)
				equal(
					typeof macAddress,
					'string',
					"#{macAddress} is string"
				)
				equal(
					isMac(macAddress),
					true,
					"#{macAddress} is mac address"
				)
				return done()
