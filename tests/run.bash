#!/usr/bin/env bats

@test "first run" {
  repository=$(pwd)
  temporaryDirectory=$(mktemp -d)
  expected=$temporaryDirectory/expected
  cp -r ./tests/first-run/expected/. $expected
  mkdir -p $expected/submodules/dreck
  cp -r ./submodules/dreck $expected/submodules
  mkdir -p $expected/submodules/plugins/pug
  cp -r . $expected/submodules/plugins/pug
  actual=$temporaryDirectory/actual
  cp -r ./tests/first-run/input/. $actual
  mkdir -p $actual/submodules/dreck
  cp -r ./submodules/dreck $actual/submodules
  mkdir -p $actual/submodules/plugins/pug
  cp -r . $actual/submodules/plugins/pug
  cd $actual

  make --file ./submodules/dreck/makefile

  rm -r $actual/submodules/plugins/pug/node_modules $actual/submodules/plugins/pug/npm-install-marker $actual/submodules/plugins/pug/generated-options.json
  cd $repository
  diff --brief --recursive $actual $expected
  rm -rf $temporaryDirectory
}
