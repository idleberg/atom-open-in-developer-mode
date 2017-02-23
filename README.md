# open-in-developer-mode

[![apm](https://img.shields.io/apm/l/open-in-developer-mode.svg?style=flat-square)](https://atom.io/packages/open-in-developer-mode)
[![apm](https://img.shields.io/apm/v/open-in-developer-mode.svg?style=flat-square)](https://atom.io/packages/open-in-developer-mode)
[![apm](https://img.shields.io/apm/dm/open-in-developer-mode.svg?style=flat-square)](https://atom.io/packages/open-in-developer-mode)
[![Travis](https://img.shields.io/travis/idleberg/atom-open-in-developer-mode.svg?style=flat-square)](https://travis-ci.org/idleberg/atom-open-in-developer-mode)
[![David](https://img.shields.io/david/dev/idleberg/atom-open-in-developer-mode.svg?style=flat-square)](https://david-dm.org/idleberg/atom-open-in-developer-mode?type=dev)

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

## Donate

You are welcome support this project using [Flattr](https://flattr.com/submit/auto?user_id=idleberg&url=https://github.com/idleberg/atom-open-in-developer-mode) or Bitcoin `17CXJuPsmhuTzFV2k4RKYwpEHVjskJktRd`
