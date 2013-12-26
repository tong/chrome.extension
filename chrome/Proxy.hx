package chrome;

import chrome.types.ChromeSetting;

private typedef ProxyError = {
	var fatal : Bool;
	var error : String;
	var details : String;
}

@:require(chrome_ext)
@:native("chrome.proxy")
extern class Proxy {
	static var settings : ChromeSetting;
	static var onProxyError(default,never) : Event<ProxyError->Void>;
}
