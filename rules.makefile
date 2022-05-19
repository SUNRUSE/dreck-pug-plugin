./submodules/plugins/pug/npm-install-marker: ./submodules/plugins/pug/package.json ./submodules/plugins/pug/package-lock.json
	npm ci --prefix ./submodules/plugins/pug
	touch $@

./submodules/plugins/pug/generated-options.json: ${DRECK_HTML_VARIABLE_PATHS}
	node ./submodules/plugins/pug/generate-options.js ${DRECK_HTML_VARIABLE_PATHS}

DRECK_PUG_PERCENT = %

./ephemeral/intermediate/%.html: $$(patsubst ./$${DRECK_PUG_PERCENT}.pug, ./ephemeral/src/$${DRECK_PUG_PERCENT}.pug, $$(filter ${DRECK_SRC_PATHS}, $$(addprefix ./, $$(addsuffix .pug, %)))) $$(patsubst ./$${DRECK_PUG_PERCENT}.pug, ./ephemeral/intermediate/$${DRECK_PUG_PERCENT}.pug, $$(filter ${DRECK_INTERMEDIATE_PATHS}, $$(addprefix ./, $$(addsuffix .pug, %)))) ./submodules/plugins/pug/generated-options.json ./submodules/plugins/pug/npm-install-marker
	mkdir -p $(dir $@)
	cd ./submodules/plugins/pug && npx pug --obj ./generated-options.json --out $(dir ../../../$@) ../../../$<
