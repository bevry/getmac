# History

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
