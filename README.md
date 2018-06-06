<!-- TITLE/ -->

<h1>getmac</h1>

<!-- /TITLE -->


<!-- BADGES/ -->

<span class="badge-travisci"><a href="http://travis-ci.org/bevry/getmac" title="Check this project's build status on TravisCI"><img src="https://img.shields.io/travis/bevry/getmac/master.svg" alt="Travis CI Build Status" /></a></span>
<span class="badge-npmversion"><a href="https://npmjs.org/package/getmac" title="View this project on NPM"><img src="https://img.shields.io/npm/v/getmac.svg" alt="NPM version" /></a></span>
<span class="badge-npmdownloads"><a href="https://npmjs.org/package/getmac" title="View this project on NPM"><img src="https://img.shields.io/npm/dm/getmac.svg" alt="NPM downloads" /></a></span>
<span class="badge-daviddm"><a href="https://david-dm.org/bevry/getmac" title="View the status of this project's dependencies on DavidDM"><img src="https://img.shields.io/david/bevry/getmac.svg" alt="Dependency Status" /></a></span>
<span class="badge-daviddmdev"><a href="https://david-dm.org/bevry/getmac#info=devDependencies" title="View the status of this project's development dependencies on DavidDM"><img src="https://img.shields.io/david/dev/bevry/getmac.svg" alt="Dev Dependency Status" /></a></span>
<br class="badge-separator" />
<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-flattr"><a href="https://flattr.com/profile/balupton" title="Donate to this project using Flattr"><img src="https://img.shields.io/badge/flattr-donate-yellow.svg" alt="Flattr donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>
<span class="badge-bitcoin"><a href="https://bevry.me/bitcoin" title="Donate once-off to this project using Bitcoin"><img src="https://img.shields.io/badge/bitcoin-donate-yellow.svg" alt="Bitcoin donate button" /></a></span>
<span class="badge-wishlist"><a href="https://bevry.me/wishlist" title="Buy an item on our wishlist for us"><img src="https://img.shields.io/badge/wishlist-donate-yellow.svg" alt="Wishlist browse button" /></a></span>
<br class="badge-separator" />
<span class="badge-slackin"><a href="https://slack.bevry.me" title="Join this project's slack community"><img src="https://slack.bevry.me/badge.svg" alt="Slack community badge" /></a></span>

<!-- /BADGES -->


<!-- DESCRIPTION/ -->

Get the mac address of the current machine you are on

<!-- /DESCRIPTION -->


Will run anywhere that the underlying commands are present:

- On Windows, [getmac](https://technet.microsoft.com/en-us/library/ff961509(v=ws.10).aspx) is used

- On Unix/Linux/Mac, [ifconfig](http://man7.org/linux/man-pages/man8/ifconfig.8.html) is used if present, otherwise [ip](http://man7.org/linux/man-pages/man8/ip.8.html) is used

- Other environments are not supported as they provide no way of fetching the mac address.

That means:

- If you are building a server app, or a desktop app, and wanting to get the mac address of where the node.js process is run, then this will work as expected.

- If you are building a server app, this will only get the mac address of the server. There is no way to get a web browser user's mac address without installing software on their computer.

- If you are building an electron app, you can run this on the server-side then communicate it to the client side.

- This library will not run in web browsers / on the client-side / in webpack / in browserify / in angular / in react / in jQuery / in HTML. It will only run on node.js environments, which the web browser is not.


<!-- INSTALL/ -->

<h2>Install</h2>

<a href="https://npmjs.com" title="npm is a package manager for javascript"><h3>NPM</h3></a><ul>
<li>Install: <code>npm install --save getmac</code></li>
<li>Executable: <code>getmac-node</code></li>
<li>Module: <code>require('getmac')</code></li></ul>

<h3><a href="https://github.com/bevry/editions" title="Editions are the best way to produce and consume packages you care about.">Editions</a></h3>

<p>This package is published with the following editions:</p>

<ul><li><code>getmac</code> aliases <code>getmac/index.js</code> which uses <a href="https://github.com/bevry/editions" title="Editions are the best way to produce and consume packages you care about.">Editions</a> to automatically select the correct edition for the consumers environment</li>
<li><code>getmac/source/index.coffee</code> is Source + CoffeeScript + <a href="https://nodejs.org/dist/latest-v5.x/docs/api/modules.html" title="Node/CJS Modules">Require</a></li>
<li><code>getmac/esnext/index.js</code> is CoffeeScript Compiled + <a href="https://babeljs.io/docs/learn-es2015/" title="ECMAScript Next">ESNext</a> + <a href="https://nodejs.org/dist/latest-v5.x/docs/api/modules.html" title="Node/CJS Modules">Require</a></li>
<li><code>getmac/es2015/index.js</code> is CoffeeScript Compiled + <a href="http://babeljs.io/docs/plugins/preset-es2015/" title="ECMAScript 2015">ES2015</a> + <a href="https://nodejs.org/dist/latest-v5.x/docs/api/modules.html" title="Node/CJS Modules">Require</a></li></ul>

<p>Older environments may need <a href="https://babeljs.io/docs/usage/polyfill/" title="A polyfill that emulates missing ECMAScript environment features">Babel's Polyfill</a> or something similar.</p>

<!-- /INSTALL -->


## Usage

### CLI

Install globally `npm install -g getmac`, then run with `getmac-node`

### API

Install locally `npm install --save getmac`, then use like so:

``` javascript
// Fetch the computer's mac address
require('getmac').getMac(function(err, macAddress){
	if (err)  throw err
	console.log(macAddress)
})

// Fetch the computer's mac address for a specfici interace
require('getmac').getMac({iface: 'eth0'}, function(err, macAddress){
	if (err)  throw err
	console.log(macAddress)
})

// Validate that an address is a mac address
if ( require('getmac').isMac("e4:ce:8f:5b:a7:fc") ) {
	console.log('valid mac')
}
else {
	console.log('invalid mac')
}
```



<!-- HISTORY/ -->

<h2>History</h2>

<a href="https://github.com/bevry/getmac/blob/master/HISTORY.md#files">Discover the release history by heading on over to the <code>HISTORY.md</code> file.</a>

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

<h2>Contribute</h2>

<a href="https://github.com/bevry/getmac/blob/master/CONTRIBUTING.md#files">Discover how you can contribute by heading on over to the <code>CONTRIBUTING.md</code> file.</a>

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

<h2>Backers</h2>

<h3>Maintainers</h3>

These amazing people are maintaining this project:

<ul><li><a href="http://balupton.com">Benjamin Lupton</a> — <a href="https://github.com/bevry/getmac/commits?author=balupton" title="View the GitHub contributions of Benjamin Lupton on repository bevry/getmac">view contributions</a></li></ul>

<h3>Sponsors</h3>

No sponsors yet! Will you be the first?

<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-flattr"><a href="https://flattr.com/profile/balupton" title="Donate to this project using Flattr"><img src="https://img.shields.io/badge/flattr-donate-yellow.svg" alt="Flattr donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>
<span class="badge-bitcoin"><a href="https://bevry.me/bitcoin" title="Donate once-off to this project using Bitcoin"><img src="https://img.shields.io/badge/bitcoin-donate-yellow.svg" alt="Bitcoin donate button" /></a></span>
<span class="badge-wishlist"><a href="https://bevry.me/wishlist" title="Buy an item on our wishlist for us"><img src="https://img.shields.io/badge/wishlist-donate-yellow.svg" alt="Wishlist browse button" /></a></span>

<h3>Contributors</h3>

These amazing people have contributed code to this project:

<ul><li><a href="http://balupton.com">Benjamin Lupton</a> — <a href="https://github.com/bevry/getmac/commits?author=balupton" title="View the GitHub contributions of Benjamin Lupton on repository bevry/getmac">view contributions</a></li>
<li><a href="https://github.com/StephenBrown2">Stephen Brown II</a> — <a href="https://github.com/bevry/getmac/commits?author=StephenBrown2" title="View the GitHub contributions of Stephen Brown II on repository bevry/getmac">view contributions</a></li>
<li><a href="https://github.com/tedshroyer">ted shroyer</a> — <a href="https://github.com/bevry/getmac/commits?author=tedshroyer" title="View the GitHub contributions of ted shroyer on repository bevry/getmac">view contributions</a></li>
<li><a href="http://caasih.net">caasi Huang</a> — <a href="https://github.com/bevry/getmac/commits?author=caasi" title="View the GitHub contributions of caasi Huang on repository bevry/getmac">view contributions</a></li>
<li><a href="https://github.com/zboszor">zboszor</a> — <a href="https://github.com/bevry/getmac/commits?author=zboszor" title="View the GitHub contributions of zboszor on repository bevry/getmac">view contributions</a></li></ul>

<a href="https://github.com/bevry/getmac/blob/master/CONTRIBUTING.md#files">Discover how you can contribute by heading on over to the <code>CONTRIBUTING.md</code> file.</a>

<!-- /BACKERS -->


<!-- LICENSE/ -->

<h2>License</h2>

Unless stated otherwise all works are:

<ul><li>Copyright &copy; 2013+ <a href="http://bevry.me">Bevry Pty Ltd</a></li></ul>

and licensed under:

<ul><li><a href="http://spdx.org/licenses/MIT.html">MIT License</a></li></ul>

<!-- /LICENSE -->
