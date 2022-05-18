DRECK_INTERMEDIATE_PATHS += ./from-intermediate.pug ./example-local-a ./example-local-b

DRECK_INTERMEDIATE_PUG_PATHS += ./from-intermediate.pug

DRECK_HTML_VARIABLE_PATHS += ./ephemeral/intermediate/example-local-a ./ephemeral/intermediate/example-local-b

./ephemeral/intermediate/from-intermediate.pug:
	mkdir -p $(dir $@)
	cp ./submodules/plugins/other-plugin/from-intermediate.pug $@

./ephemeral/intermediate/example-local-a:
	mkdir -p $(dir $@)
	cp ./submodules/plugins/other-plugin/example-local-a $@

./ephemeral/intermediate/example-local-b:
	mkdir -p $(dir $@)
	cp ./submodules/plugins/other-plugin/example-local-b $@
