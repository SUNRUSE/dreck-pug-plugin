./ephemeral/intermediate/from-intermediate.pug:
	mkdir -p $(dir $@)
	cp ./submodules/plugins/other-plugin/from-intermediate.pug $@

./ephemeral/intermediate/example-local-a:
	mkdir -p $(dir $@)
	cp ./submodules/plugins/other-plugin/example-local-a $@

./ephemeral/intermediate/example-local-b:
	mkdir -p $(dir $@)
	cp ./submodules/plugins/other-plugin/example-local-b $@
