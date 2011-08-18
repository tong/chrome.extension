package chrome;

@:native("chrome.proxy") extern class Proxy {
	static var settings : chrome.types.ChromeSetting;
	static var onProxyError(default,null) : Event<Dynamic->Void>;
}
