package chrome;

private typedef ProxyError = {
	var fatal : Bool;
	var error : String;
	var details : String;
}

@:native("chrome.proxy") extern class Proxy {
	static var settings : chrome.types.ChromeSetting;
	static var onProxyError(default,null) : Event<ProxyError->Void>;
}
