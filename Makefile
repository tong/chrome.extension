
## chrome-extension

PROJECT = chrome-ext
SRC := $(shell find chrome/ -type f -name '*.hx')

all: haxedoc.xml documentation $(PROJECT).zip

haxedoc.xml: $(SRC)
	haxe haxedoc.hxml

documentation: $(SRC) haxedoc.xml
	haxelib run dox -o doc/ -i ./

$(PROJECT).zip: $(SRC) haxedoc.xml
	zip -r $@ chrome/ extraParams.hxml haxedoc.xml haxelib.json README.md

install: $(PROJECT).zip
	haxelib install $(PROJECT).zip

uninstall:
	haxelib remove $(PROJECT)

clean:
	rm -f $(PROJECT).zip haxedoc.xml
	rm -rf doc/

.PHONY: all documentation install uninstall clean
	