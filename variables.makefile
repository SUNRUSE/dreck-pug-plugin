DRECK_INTERMEDIATE_PATHS += $(patsubst ./%.pug, ./%.html, $(filter %.pug, $(DRECK_SRC_PATHS) ${DRECK_INTERMEDIATE_PUG_PATHS}))
