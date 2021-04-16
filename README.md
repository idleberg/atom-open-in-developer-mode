# open-in-developer-mode

[![apm](https://flat.badgen.net/apm/license/open-in-developer-mode)](https://atom.io/packages/open-in-developer-mode)
[![apm](https://flat.badgen.net/apm/v/open-in-developer-mode)](https://atom.io/packages/open-in-developer-mode)
[![apm](https://flat.badgen.net/apm/dl/open-in-developer-mode)](https://atom.io/packages/open-in-developer-mode)
[![CircleCI](https://flat.badgen.net/circleci/github/idleberg/atom-open-in-developer-mode)](https://circleci.com/gh/idleberg/atom-open-in-developer-mode)
[![David](https://flat.badgen.net/david/dep/idleberg/atom-open-in-developer-mode)](https://david-dm.org/idleberg/atom-open-in-developer-mode)

Re-open the current file/project in developer mode

## Installation

### apm

Install `open-in-developer-mode` from Atom's [Package Manager](http://flight-manual.atom.io/using-atom/sections/atom-packages/) or the command-line equivalent:

`$ apm install open-in-developer-mode`

### Using Git

Change to your Atom packages directory:

```bash
# Windows
$ cd %USERPROFILE%\.atom\packages

# Linux & macOS
$ cd ~/.atom/packages/
```

Clone repository as `open-in-developer-mode`:

```bash
$ git clone https://github.com/idleberg/atom-open-in-developer-mode open-in-developer-mode
```

## Indicator

You can use the [`custom-title`](https://atom.io/packages/custom-title) package to add an indicator, showing whether you're in Developer Mode.

**Example:** 

    <%= fileName %><% if (projectPath) { %> – <%= projectPath %><% } %><% if (devMode) { %> (Developer Mode)<% } %>

This will append *(Developer Mode)* to the title displayed in the window title.

## License

This work is licensed under the [The MIT License](LICENSE.md).
