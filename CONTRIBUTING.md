<!--
March 5, 2015
https://github.com/bevry/base
-->


# Contribute


## Resources

- [Coding Standards](http://learn.bevry.me/community/coding-standards)
- [Documentation Guidelines](http://learn.bevry.me/community/documentation-guidelines)
- [Support Guidelines](http://learn.bevry.me/community/support-guidelines)


## Development

For developers and contributors

1. Fork project and clone your fork

2. Install global dependencies

	``` bash
	npm install -g coffee-script
	```

3. Install local dependencies

	``` bash
	cake install
	```

4. Compile project

	``` bash
	# Only once
	cake compile

	# On every change
	cake watch
	```

5. Run tests

	``` bash
	cake test
	```


## Publishing

For project maintainers

1. Update meta files with latest information

	``` bash
	cake prepublish
	```
	
	This will compile the project, run tests, and update any meta files that need updating.


2. Add a changelog entry to `HISTORY.md` with change information

	```
	## v2.0.0 April 17, 2013
	- Something changed
	- Something changed that was referenced in an issue or pull request
		- Thanks to [person](https://github.com/person) for [issue #98](https://github.com/project/issue/98)
	- Dependency updates
	```

3. Update `version` entry in `package.json` with a new number that follows semantic versioning

4. Commit changes

	``` bash
	git add -u
	git add .
	git commit -m "A message about what changed"
	```
	
	This will stage any updates and any new files for your commit, and commit them with your specified message.


5. Publish new version

	``` bash
	cake publish
	```

	This will run `cake prepublish`, publish your project to npm, create a git tag, and push the git updates. It will open your editor for specifying the description for the git tag annotation, use the changelog entry we created before (but without the `##` heading), e.g.
	
	```
	v2.0.0 April 17, 2013
	
	- Something changed
	- Something changed that was referenced in an issue or pull request
		- Thanks to [person](https://github.com/person) for [issue #98](https://github.com/project/issue/98)
	- Dependency updates
	```
