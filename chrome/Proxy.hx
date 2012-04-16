package chrome;

import chrome.types.ChromeSetting;

private typedef ProxyError = {
	var fatal : Bool;
	var error : String;
	var details : String;
}

@:native("chrome.proxy") extern class Proxy {
	static var settings : ChromeSetting;
	static var onProxyError(default,never) : Event<ProxyError->Void>;
}
