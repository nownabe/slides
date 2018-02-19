javascripts = reveal.min.js

themes = black.css league.css night.css simple.css solarized.css beige.css blood.css moon.css serif.css sky.css white.css
styles = print/paper.css print/pdf.css reveal.min.css $(addprefix theme/,$(themes))

reveal_libs = $(shell find reveal.js/lib -type f | grep -v LICENSE)

reveal_plugins = $(shell find reveal.js/plugin -type f -name "*.js") reveal.js/plugin/notes/notes.html

template_scripts = $(addprefix template/js/,$(javascripts))
template_styles  = $(addprefix template/css/,$(styles))
template_libs    = $(patsubst reveal.js/%,template/%,$(reveal_libs))
template_plugins = $(patsubst reveal.js/%,template/%,$(reveal_plugins))

template         = $(template_scripts) $(template_styles) $(template_libs) $(template_plugins)

.PHONY: update-template
update-template: update-reveal $(template)

.PHONY: update-reveal
update-reveal:
	git submodule foreach git pull origin master

.PHONY: build
build:
	cd reveal.js && npm install && npm run build

reveal.js/%: build
template/%: reveal.js/%
	@[[ -d $(shell dirname $@) ]] || mkdir -p $(shell dirname $@)
	cp $< $@

.PHONY: new
new:
	cp -r template ${name}
	make index

.PHONY: index
index:
	./index.html.sh > index.html

.PHONY: help
help:
	@echo "Usage: make [task]"
	@echo ""
	@echo "Tasks:"
	@echo ""
	@echo "    update-template     Update template"
	@echo "    new name=slidename  Create new slide from template"
	@echo "    index               Update index.html"
	@echo "    help                Show this message"
	@echo ""

dump:
	@echo ${template_libs}
	@echo ${template}
