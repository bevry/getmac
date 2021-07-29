# History

## v5.20.0 2021 July 30

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.19.0 2021 July 29

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.18.0 2021 July 28

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.17.0 2020 October 29

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.16.0 2020 September 4

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.15.0 2020 August 18

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.14.0 2020 August 4

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.13.0 2020 July 22

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.12.0 2020 July 22

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.11.0 2020 June 25

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.10.0 2020 June 21

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.9.0 2020 June 21

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.8.0 2020 June 20

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.7.0 2020 June 10

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.6.0 2020 June 10

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.5.0 2020 May 22

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.4.0 2020 May 21

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.3.0 2020 May 20

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.2.0 2020 May 6

-   Fix `Object is possibly 'undefined'` compile error
    -   Closes [issue #100](https://github.com/bevry/getmac/issues/100) thanks to [DiamondYuan](https://github.com/DiamondYuan) and [marcoburrometo](https://github.com/marcoburrometo)
-   Removes leftover `coffeescript` and `coffeelint` dev dependencies
    -   Closes [pull request #98](https://github.com/bevry/getmac/pull/98) thanks to [Jan Pilzer](https://github.com/Hirse)
-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)
-   Minimum required node version changed from `node: >=8` to `node: >=10` to keep up with mandatory ecosystem changes

## v5.1.0 2020 January 29

-   Fix using getmac under enabled tsconfig config rule `noUnusedLocals` due to unused import NetworkInterfaceInfo
    -   [Merges #96](https://github.com/bevry/getmac/pull/96) thanks to [Benoit Sepe](https://github.com/Ogdentrod)
-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v5.0.0 2019 December 18

-   If you are using CommonJS, you must now do `require('getmac').default`
-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v4.4.0 2019 December 9

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v4.3.0 2019 December 1

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v4.2.0 2019 December 1

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v4.1.0 2019 November 18

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v4.0.1 2019 November 18

-   MAC addresses with single character parts are now considered valid

## v4.0.0 2019 November 18

-   Uses the built in [`require('os').networkInterfaces()`](https://nodejs.org/dist/latest-v12.x/docs/api/os.html#os_os_networkinterfaces) instead
-   `getmac-node` now supports receiving the iface name to filter, e.g. `getmac-node en6`

## v3.0.1 2019 November 18

-   Better handling of errors with the `getmac-node` binary

## v3.0.0 2019 November 18

-   `getMac` renamed to `getMAC` and has the function signature `(iface?: string) => Promise<string>`
-   `extractMAC` is now exported, if you already have the MAC interfaces string, with the signature `(input: string, iface?: string) => string`
-   `isMac` renamed to `isMAC`
-   Converted to TypeScript
-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v2.0.0 2019 November 18

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)
-   Minimum required node version changed from `node: >=0.10` to `node: >=8` to keep up with mandatory ecosystem changes

## v1.5.0 2019 November 13

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v1.4.6 2018 September 3

-   Updated base files and [editions](https://github.com/bevry/editions) using [boundation](https://github.com/bevry/boundation)

## v1.4.5 2018 August 24

-   Updated dependencies

## v1.4.4 2018 August 19

-   Minimum supported node version is now 0.10
-   Updated base files and [editions](https://github.com/bevry/editions) using [boundation](https://github.com/bevry/boundation)

## v1.4.3 2018 June 7

-   Fix running getmac on windows when system32 is not in their path
    -   Thanks to [Gustavo Costa Neves](https://github.com/guhcostan) for [pull request #35](https://github.com/bevry/getmac/pull/37)

## v1.4.2 2018 June 6

-   Fix running as restricted user on linux
    -   Thanks to [zboszor](https://github.com/zboszor) for [pull request #35](https://github.com/bevry/getmac/pull/35)

## v1.4.1 2018 March 28

-   Fix `getmac-node` not working
    -   Thanks to [harrytse](https://github.com/klouskingsley) for [issue #28](https://github.com/bevry/getmac/issues/28) and [DarryllRobinson](https://github.com/DarryllRobinson) for [issue #27](https://github.com/bevry/getmac/issues/27)
-   Updated base files

## v1.4.0 2018 January 25

-   Now compiled with CoffeeScript v2
-   Now uses [editions](https://github.com/bevry/editions) to use the ESNext compiled edition for environments that support it, otherwise use the ES2015 compiled edition
-   Updated base files

## v1.3.0 2018 January 25

-   Fetch the mac address of a specific interface using the `iface` option
    -   Thanks to [caasi Huang](https://github.com/caasi) for [pull request #22](https://github.com/bevry/getmac/pull/22)

## v1.2.1 2016 May 10

-   Use down interfaces as well as up interfaces - Thanks to [Ted Shroyer](https://github.com/tedshroyer) for [pull request #15](https://github.com/bevry/getmac/pull/15)

## v1.1.0 2016 May 10

-   Updated dependencies
-   Repackaged

## v1.0.7 2015 March 5

-   Added fix for iproute2 commands in absence of ifconfig on Linux machines

## v1.0.6 2013 October 27

-   Repackaged

## v1.0.5 2013 September 2

-   Will now ignore zero-filled mac addresses and error if none are found - Thanks to [Uwe Klawitter](https://github.com/uklawitter) for [issue #1](https://github.com/bevry/getmac/issues/1)
-   Can now pass an optional object as the first argument to `getmac` that can contain `data` as a String to scan instead of executing the appropriate command to fetch the data
-   Dependency updates

## v1.0.4 2013 February 12

-   Better compatibility with linux distros

## v1.0.3 2013 February 12

-   Minor optimisation

## v1.0.2 2013 February 12

-   Fixed windows support, turns out they format mac addresses differently

## v1.0.1 2013 February 12

-   Renamed `getmac` executable to `getmac-node` to avoid conflict on windows

## v1.0.0 2013 February 12

-   Initial working commit
