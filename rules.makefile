./plugins/pug/npm-install-marker: ./plugins/pug/package.json ./plugins/pug/package-lock.json
	npm ci --prefix ./plugins/pug
	touch $@

./plugins/pug/generated-options.json: ${DRECK_PUG_INPUT_LOCAL_PATHS}
	node ./plugins/pug/generate-options.js ${DRECK_PUG_INPUT_LOCAL_PATHS}

./plugins/pug/generated/%.html: ./%.pug ./plugins/pug/generated-options.json ./plugins/pug/npm-install-marker
	mkdir -p $(dir $@)
	cd ./plugins/pug && npx pug --obj ./generated-options.json --out $(dir ../../$@) ../../$<
