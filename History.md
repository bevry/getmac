## History

- v1.0.5 September 2, 2011
	- Will now ignore zero-filled mac addresses and error if none are found
		- Thanks to [Uwe Klawitter](https://github.com/uklawitter) for [issue #1](https://github.com/bevry/getmac/issues/1)
	- Can now pass an optional object as the first argument to `getmac` that can contain `data` as a String to scan instead of executing the appropriate command to fetch the data
	- Dependency updates

- v1.0.4 February 12, 2011
	- Better compatibility with linux distros

- v1.0.3 February 12, 2011
	- Minor optimisation

- v1.0.2 February 12, 2011
	- Fixed windows support, turns out they format mac addresses differently

- v1.0.1 February 12, 2011
	- Renamed `getmac` executable to `getmac-node` to avoid conflict on windows

- v1.0.0 February 12, 2011
	- Initial working commit
