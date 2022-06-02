./plugins/other-plugin/generated/example-template.pug:
	mkdir -p $(dir $@)
	cp ./plugins/other-plugin/example-template.pug $@

./plugins/other-plugin/generated/example-local-a:
	mkdir -p $(dir $@)
	cp ./plugins/other-plugin/example-local-a $@

./plugins/other-plugin/generated/example-local-b:
	mkdir -p $(dir $@)
	cp ./plugins/other-plugin/example-local-b $@

./plugins/other-plugin/generated/dreck_pug_output_html_paths.txt:
	mkdir -p $(dir $@)
	echo $(DRECK_PUG_OUTPUT_HTML_PATHS) > $@
