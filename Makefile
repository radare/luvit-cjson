VERSION := 1.0.4

all: json

json: build/lua-cjson/cjson.so

build/lua-cjson/cjson.so: build/lua-cjson
	LUA_INCLUDE_DIR=$(LUA_DIR) make -C $^

build/lua-cjson:
	mkdir -p build
	wget http://www.kyne.com.au/~mark/software/lua-cjson-$(VERSION).tar.gz -O - | tar -xzpf - -C build
	mv build/lua-cjson-* $@

.PHONY: all json
.SILENT:
