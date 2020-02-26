
# Haxe Chrome Extension [![Build Status](https://travis-ci.org/tong/chrome.extension.svg?branch=master)](https://travis-ci.org/tong/chrome.extension) [![Haxelib Version](https://img.shields.io/github/tag/tong/chrome.extension.svg?style=flat&label=haxelib)](https://lib.haxe.org/p/chrome-extension)

Haxe/Javascript type definitions for [google chrome extensions](https://developer.chrome.com/extensions/api_index).

API version: 80


### Install
```sh
$ haxelib install chrome-extension
```

For chrome apps types see: https://github.com/tong/chrome.app


### Usage
```sh
-lib chrome_extension
```


### Haxe Defines

* `-D chrome`  Required (added automatically when using from haxelib)
* `-D chrome_ext`  Required (added automatically when using from haxelib)
* `-D chrome_os`  To access apis available on chrome-os only.
* `-D chrome_dev`  To access apis available on the dev channel only.
* `-D chrome_experimental`  To access experimental apis.
