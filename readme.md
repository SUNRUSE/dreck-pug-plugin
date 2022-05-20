# Dreck Pug Plugin [![License](https://img.shields.io/github/license/sunruse/dreck-pug-plugin.svg)](https://github.com/sunruse/dreck-pug-plugin/blob/master/license) [![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)

Renders all `*.pug` source files (and specific `*.pug` intermediate files) to equivalent `*.html` intermediate files (e.g. `./src/a/b.pug` renders to `./ephemeral/intermediate/a/b.html`).

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

    - run: make --file ./submodules/dreck/makefile
      shell: bash
    - if: github.event_name == 'release' && github.event.action == 'created'
      uses: softprops/action-gh-release@v1
      with:
        files: dist/**
```

## Installation

Run the following in a Bash shell at the root of your project:

```bash
git submodule add https://github.com/sunruse/dreck-pug-plugin submodules/plugins/pug
```

## Locals

The file corresponding to each file listed within the `DRECK_HTML_VARIABLE_PATHS` Make variable will be read and available as a local within each Pug file.

For example, if `DRECK_HTML_VARIABLE_PATHS` included `./path/to/an/example/file`, and `./path/to/an/example/file` contained the text `Example Local`, the following Pug file:

```pug
p #{locals[`/path/to/an/example/file`]}
```

Would render as:

```pug
<p>Example Local</p>
```

## Rendering of generated Pug files

By default, this plugin will render all `*.pug` files in `./src/**` and `./submodules/plugins/*/src/**`.

It can additionally render Pug files in `./ephemeral/intermediate`, but requires that their paths be appeneded to the `DRECK_INTERMEDIATE_PUG_PATHS` Make variable.

For example, if `DRECK_INTERMEDIATE_PUG_PATHS` contained `./a/b.pug`, the Pug file at `./ephemeral/intermediate/a/b.pug` would be rendered to `./ephemeral/intermediate/a/b.html`.

## Minification

This plugin expects that another plugin will minify the generated `*.html` files and write the resulting files to the `dist` directory.  It appends the names of the generated HTML files to the Make variable `DRECK_INTERMEDIATE_HTML_PATHS` (e.g. `./src/a/b.pug` would appear in `DRECK_INTERMEDIATE_HTML_PATHS` as `./a/b.html`).

TODO subdirectory checks
