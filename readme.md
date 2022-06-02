# Dreck Pug Plugin [![License](https://img.shields.io/github/license/sunruse/dreck-pug-plugin.svg)](https://github.com/sunruse/dreck-pug-plugin/blob/master/license) [![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)

Renders specified Pug templates to equivalent HTML documents.

## Dependencies

- NodeJS 10.19.0 or later.
- NPM 6.14.4 or later.
- NPX 6.14.4 or later.

All must be available on the PATH (e.g. `node --version`, `npm --version` and `npx --version` all print version strings when executed in a Bash terminal).

### Installing on Debian-based Linux distributions

These are available from most Debian-based Linux distributions' package managers; for example, they can be installed when running Ubuntu 20.04 LTS using the following command:

```bash
sudo apt-get install nodejs npm --yes
```

### Installing within GitHub Actions

Add an appropriate [actions/setup-node](https://github.com/actions/setup-node) action step **before** the `make` action step:

```yml
name: Continuous Integration
on: [push, pull_request, release]
jobs:
  main:
    runs-on: ubuntu-20.04
    steps:
    - uses: actions/checkout@v3
      with:
        submodules: true

    # Insert this block:
    ###############################
    - uses: actions/setup-node@v3
      with:
        node-version: 12
    ###############################

    - run: make --file ./dreck/makefile
      shell: bash
    - if: github.event_name == 'release' && github.event.action == 'created'
      uses: softprops/action-gh-release@v1
      with:
        files: dist/**
```

## Installation

Run the following in a Bash shell at the root of your project:

```bash
git submodule add https://github.com/sunruse/dreck-pug-plugin plugins/pug
```

## Input

### Templates

This plugin renders every Pug file in the `DRECK_PUG_INPUT_PUG_PATHS` Make variable as an input Pug template.

### Locals

Each file listed in `DRECK_PUG_INPUT_LOCAL_PATHS` will be read in as a Pug local.

For example, if `DRECK_PUG_INPUT_LOCAL_PATHS` included `./path/to/an/example/file`, and `./path/to/an/example/file` contained the text `Example Local`, the following Pug file:

```pug
p #{locals[`/path/to/an/example/file`]}
```

Would render as:

```pug
<p>Example Local</p>
```

## Output

This plugin writes an equivalent HTML document for each input Pug template.  For example, if `DRECK_PUG_INPUT_PUG_PATHS` contained `./a/b-c.pug`, `./plugins/pug/generated/a/b-c.html` would be written to disk.

Their paths are listed in the `DRECK_PUG_OUTPUT_HTML_PATHS` Make variable, space separated.
