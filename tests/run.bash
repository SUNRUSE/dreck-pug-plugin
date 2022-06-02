#!/usr/bin/env bats

@test "first run" {
  repository=$(pwd)
  temporaryDirectory=$(mktemp -d)
  expected=$temporaryDirectory/expected
  cp -r ./tests/first-run/expected/. $expected
  cp -r ./dreck $expected/plugins
  mkdir -p $expected/plugins/pug
  cp -r . $expected/plugins/pug
  actual=$temporaryDirectory/actual
  cp -r ./tests/first-run/input/. $actual
  mkdir -p $actual/plugins/dreck
  cp -r ./dreck $actual/plugins
  mkdir -p $actual/plugins/pug
  cp -r . $actual/plugins/pug
  cd $actual

  make --file ./plugins/dreck/makefile

  rm -r $actual/plugins/pug/node_modules $actual/plugins/pug/npm-install-marker $actual/plugins/pug/generated-options.json
  cd $repository
  diff --brief --recursive $actual $expected
  rm -rf $temporaryDirectory
}
