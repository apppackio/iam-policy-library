.DEFAULT_GOAL := all

.PHONY: convert-all
convert-all:
	find ./library -name '*.json' -exec ./library/generate_terraform.sh {} \;

.PHONY: clean
clean:
	find ./library -name '*.tf' -delete

.PHONY: fmt-json
fmt-json:
	npx prettier -w ./library/**/*.json
.PHONY: fmt-docs
fmt-docs:
	npx prettier -w ./src
.PHONY: fmt-tf
# Not needed since these are being generated
# fmt-tf:
# 	terraform fmt -recursive ./library
.PHONY: fmt
fmt: fmt-json fmt-docs

.PHONY: serve
serve:
	pdm run mkdocs serve

.PHONY: all
all: convert-all fmt
