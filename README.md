<!-- TITLE/ -->

# getmac

<!-- /TITLE -->

<!-- BADGES/ -->

<span class="badge-githubworkflow"><a href="https://github.com/bevry/getmac/actions?query=workflow%3Abevry" title="View the status of this project's GitHub Workflow: bevry"><img src="https://github.com/bevry/getmac/workflows/bevry/badge.svg" alt="Status of the GitHub Workflow: bevry" /></a></span>
<span class="badge-npmversion"><a href="https://npmjs.org/package/getmac" title="View this project on NPM"><img src="https://img.shields.io/npm/v/getmac.svg" alt="NPM version" /></a></span>
<span class="badge-npmdownloads"><a href="https://npmjs.org/package/getmac" title="View this project on NPM"><img src="https://img.shields.io/npm/dm/getmac.svg" alt="NPM downloads" /></a></span>
<br class="badge-separator" />
<span class="badge-githubsponsors"><a href="https://github.com/sponsors/balupton" title="Donate to this project using GitHub Sponsors"><img src="https://img.shields.io/badge/github-donate-yellow.svg" alt="GitHub Sponsors donate button" /></a></span>
<span class="badge-thanksdev"><a href="https://thanks.dev/u/gh/bevry" title="Donate to this project using ThanksDev"><img src="https://img.shields.io/badge/thanksdev-donate-yellow.svg" alt="ThanksDev donate button" /></a></span>
<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-liberapay"><a href="https://liberapay.com/bevry" title="Donate to this project using Liberapay"><img src="https://img.shields.io/badge/liberapay-donate-yellow.svg" alt="Liberapay donate button" /></a></span>
<span class="badge-buymeacoffee"><a href="https://buymeacoffee.com/balupton" title="Donate to this project using Buy Me A Coffee"><img src="https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg" alt="Buy Me A Coffee donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-crypto"><a href="https://bevry.me/crypto" title="Donate to this project using Cryptocurrency"><img src="https://img.shields.io/badge/crypto-donate-yellow.svg" alt="crypto donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>
<br class="badge-separator" />
<span class="badge-discord"><a href="https://discord.gg/nQuXddV7VP" title="Join this project's community on Discord"><img src="https://img.shields.io/discord/1147436445783560193?logo=discord&amp;label=discord" alt="Discord server badge" /></a></span>
<span class="badge-twitch"><a href="https://www.twitch.tv/balupton" title="Join this project's community on Twitch"><img src="https://img.shields.io/twitch/status/balupton?logo=twitch" alt="Twitch community badge" /></a></span>

<!-- /BADGES -->

<!-- DESCRIPTION/ -->

Get the MAC address of the current machine you are on.

<!-- /DESCRIPTION -->


This library will not run in web browsers / on the client-side / in webpack / in browserify / in angular / in react / in jQuery / in HTML. It will only run on Node.js environments, which the web browser is not.

## Usage

[Complete API Documentation.](http://master.getmac.bevry.surge.sh/docs/)

### CLI

Install globally `npm install -g getmac`, then run with `getmac-node`

### API

Install locally `npm install --save getmac`, then use like so:

```javascript
import getMAC, { isMAC } from 'getmac'

// Fetch the computer's MAC address
console.log(getMAC())

// Fetch the computer's MAC address for a specific interface
console.log(getMAC('eth0'))

// Validate that an address is a MAC address
if (isMAC('e4:ce:8f:5b:a7:fc')) {
    console.log('valid MAC')
} else {
    console.log('invalid MAC')
}
```

### Advanced

If you want to do advanced filtering, use [`os.networkInterfaces()`](https://nodejs.org/dist/latest-v12.x/docs/api/os.html#os_os_networkinterfaces) instead.

<!-- INSTALL/ -->

## Install

### [npm](https://npmjs.com "npm is a package manager for javascript")

-   Install: `npm install --save getmac`
-   Import: `import pkg from ('getmac')`
-   Require: `const pkg = require('getmac').default`

### [Deno](https://deno.land "Deno is a secure runtime for JavaScript and TypeScript, it is an alternative for Node.js")

``` typescript
import pkg from 'https://unpkg.com/getmac@^6.6.0/edition-deno/index.ts'
```
### [Editions](https://editions.bevry.me "Editions are the best way to produce and consume packages you care about.")

This package is published with the following editions:
-   `getmac/source/index.ts` is [TypeScript](https://www.typescriptlang.org/ "TypeScript is a typed superset of JavaScript that compiles to plain JavaScript.") source code with [Import](https://babeljs.io/docs/learn-es2015/#modules "ECMAScript Modules") for modules
-   `getmac` aliases `getmac/edition-es2022/index.js`
-   `getmac/edition-es2022/index.js` is [TypeScript](https://www.typescriptlang.org/ "TypeScript is a typed superset of JavaScript that compiles to plain JavaScript.") compiled against [ES2022](https://en.wikipedia.org/wiki/ES2022 "ECMAScript 2022") for [Node.js](https://nodejs.org "Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine") 8 || 10 || 12 || 14 || 16 || 18 || 20 || 21 with [Require](https://nodejs.org/dist/latest-v5.x/docs/api/modules.html "Node/CJS Modules") for modules
-   `getmac/edition-es2022-esm/index.js` is [TypeScript](https://www.typescriptlang.org/ "TypeScript is a typed superset of JavaScript that compiles to plain JavaScript.") compiled against [ES2022](https://en.wikipedia.org/wiki/ES2022 "ECMAScript 2022") for [Node.js](https://nodejs.org "Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine") 12 || 14 || 16 || 18 || 20 || 21 with [Import](https://babeljs.io/docs/learn-es2015/#modules "ECMAScript Modules") for modules
-   `getmac/edition-types/index.d.ts` is [TypeScript](https://www.typescriptlang.org/ "TypeScript is a typed superset of JavaScript that compiles to plain JavaScript.") compiled Types with [Import](https://babeljs.io/docs/learn-es2015/#modules "ECMAScript Modules") for modules
-   `getmac/edition-deno/index.ts` is [TypeScript](https://www.typescriptlang.org/ "TypeScript is a typed superset of JavaScript that compiles to plain JavaScript.") source code made to be compatible with [Deno](https://deno.land "Deno is a secure runtime for JavaScript and TypeScript, it is an alternative to Node.js")

<!-- /INSTALL -->

<!-- HISTORY/ -->

## History

[Discover the release history by heading on over to the `HISTORY.md` file.](https://github.com/bevry/getmac/blob/HEAD/HISTORY.md#files)

<!-- /HISTORY -->

<!-- BACKERS/ -->

## Backers

### Code

[Discover how to contribute via the `CONTRIBUTING.md` file.](https://github.com/bevry/getmac/blob/HEAD/CONTRIBUTING.md#files)

#### Authors

-   [Benjamin Lupton](https://balupton.com) — Accelerating collaborative wisdom.

#### Maintainers

-   [Benjamin Lupton](https://balupton.com) — Accelerating collaborative wisdom.

#### Contributors

-   [Benjamin Lupton](https://github.com/balupton) — [view contributions](https://github.com/bevry/getmac/commits?author=balupton "View the GitHub contributions of Benjamin Lupton on repository bevry/getmac")
-   [Benoit Sepe](https://github.com/benoitsepe) — [view contributions](https://github.com/bevry/getmac/commits?author=benoitsepe "View the GitHub contributions of Benoit Sepe on repository bevry/getmac")
-   [Gustavo Costa Neves](https://github.com/guhcostan) — [view contributions](https://github.com/bevry/getmac/commits?author=guhcostan "View the GitHub contributions of Gustavo Costa Neves on repository bevry/getmac")
-   [Isaac Huang](https://github.com/caasi) — [view contributions](https://github.com/bevry/getmac/commits?author=caasi "View the GitHub contributions of Isaac Huang on repository bevry/getmac")
-   [Jan Pilzer](https://github.com/Hirse) — [view contributions](https://github.com/bevry/getmac/commits?author=Hirse "View the GitHub contributions of Jan Pilzer on repository bevry/getmac")
-   [Stephen Brown II](https://github.com/StephenBrown2) — [view contributions](https://github.com/bevry/getmac/commits?author=StephenBrown2 "View the GitHub contributions of Stephen Brown II on repository bevry/getmac")
-   [ted shroyer](https://github.com/tedshroyer) — [view contributions](https://github.com/bevry/getmac/commits?author=tedshroyer "View the GitHub contributions of ted shroyer on repository bevry/getmac")
-   [zboszor](https://github.com/zboszor) — [view contributions](https://github.com/bevry/getmac/commits?author=zboszor "View the GitHub contributions of zboszor on repository bevry/getmac")

### Finances

<span class="badge-githubsponsors"><a href="https://github.com/sponsors/balupton" title="Donate to this project using GitHub Sponsors"><img src="https://img.shields.io/badge/github-donate-yellow.svg" alt="GitHub Sponsors donate button" /></a></span>
<span class="badge-thanksdev"><a href="https://thanks.dev/u/gh/bevry" title="Donate to this project using ThanksDev"><img src="https://img.shields.io/badge/thanksdev-donate-yellow.svg" alt="ThanksDev donate button" /></a></span>
<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-liberapay"><a href="https://liberapay.com/bevry" title="Donate to this project using Liberapay"><img src="https://img.shields.io/badge/liberapay-donate-yellow.svg" alt="Liberapay donate button" /></a></span>
<span class="badge-buymeacoffee"><a href="https://buymeacoffee.com/balupton" title="Donate to this project using Buy Me A Coffee"><img src="https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg" alt="Buy Me A Coffee donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-crypto"><a href="https://bevry.me/crypto" title="Donate to this project using Cryptocurrency"><img src="https://img.shields.io/badge/crypto-donate-yellow.svg" alt="crypto donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>

#### Sponsors

-   [Andrew Nesbitt](https://nesbitt.io) — Software engineer and researcher
-   [Balsa](https://balsa.com) — We're Balsa, and we're building tools for builders.
-   [Codecov](https://codecov.io) — Empower developers with tools to improve code quality and testing.
-   [Poonacha Medappa](https://poonachamedappa.com)
-   [Rob Morris](https://github.com/Rob-Morris)
-   [Sentry](https://sentry.io) — Real-time crash reporting for your web apps, mobile apps, and games.
-   [Syntax](https://syntax.fm) — Syntax Podcast

#### Donors

-   [Andrew Nesbitt](https://nesbitt.io)
-   [Armen Mkrtchian](https://mogoni.dev)
-   [Balsa](https://balsa.com)
-   [Chad](https://opencollective.com/chad8)
-   [Codecov](https://codecov.io)
-   [dr.dimitru](https://veliovgroup.com)
-   [Elliott Ditman](https://elliottditman.com)
-   [entroniq](https://gitlab.com/entroniq)
-   [GitHub](https://github.com/about)
-   [Hunter Beast](https://cryptoquick.com)
-   [Jean-Luc Geering](https://github.com/jlgeering)
-   [Michael Duane Mooring](https://mdm.cc)
-   [Michael Harry Scepaniak](https://michaelscepaniak.com)
-   [Mohammed Shah](https://github.com/smashah)
-   [Mr. Henry](https://mrhenry.be)
-   [Nermal](https://arjunaditya.vercel.app)
-   [Pleo](https://pleo.io)
-   [Poonacha Medappa](https://poonachamedappa.com)
-   [Rob Morris](https://github.com/Rob-Morris)
-   [Robert de Forest](https://github.com/rdeforest)
-   [Sentry](https://sentry.io)
-   [ServieJS](https://github.com/serviejs)
-   [Skunk Team](https://skunk.team)
-   [Syntax](https://syntax.fm)
-   [WriterJohnBuck](https://github.com/WriterJohnBuck)

<!-- /BACKERS -->

<!-- LICENSE/ -->

## License

Unless stated otherwise all works are:

-   Copyright &copy; [Benjamin Lupton](https://balupton.com)

and licensed under:

-   [Artistic License 2.0](http://spdx.org/licenses/Artistic-2.0.html)

<!-- /LICENSE -->
