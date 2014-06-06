package chrome;

import chrome.types.ChromeSetting;

/*
private typedef ProxyError = {
	var fatal : Bool;
	var error : String;
	var details : String;
}
*/

@:enum abstract ProxyServerScheme(String) {
	var http = "http";
	var https = "https";
	var quic = "quic";
	var socks4 = "socks4";
	var socks5 = "socks5";
}

typedef ProxyServer = {
	@:optional var scheme : ProxyServerScheme;
	var host : String;
	@:optional var port : Int;
}

typedef ProxyRules = {
	@:optional var singleProxy : ProxyServer;
	@:optional var proxyForHttp : ProxyServer;
	@:optional var proxyForHttps : ProxyServer;
	@:optional var proxyForFtp : ProxyServer;
	@:optional var fallbackProxy : ProxyServer;
	@:optional var bypassList : Array<String>;
}


@:enum abstract ProxyConfigMode(String) {
	var direct = "direct";
	var auto_detect = "auto_detect";
	var pac_script = "pac_script";
	var fixed_servers = "fixed_servers";
	var system = "system";
}

typedef ProxyConfig = {
	@:optional var rules : ProxyRules;
	@:optional var pacScript : PacScript;
	@:optional var mode : PacScript;
}

@:require(chrome_ext)
@:native("chrome.proxy")
extern class Proxy {
	static var settings : ChromeSetting;
	static var onProxyError(default,never) : Event<{fatal:Bool,error:String,details:String}->Void>;
}
