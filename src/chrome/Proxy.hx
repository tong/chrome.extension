package chrome;

import chrome.Events;
import chrome.Types;

@:enum abstract ProxyServerScheme(String) from String to String {
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

typedef PacScript = {
	@:optional var url : String;
	@:optional var data : String;
	@:optional var mandatory : Bool;
}

@:enum abstract ProxyConfigMode(String) from String to String {
	var direct = "direct";
	var auto_detect = "auto_detect";
	var pac_script = "pac_script";
	var fixed_servers = "fixed_servers";
	var system = "system";
}

typedef ProxyConfig = {
	@:optional var rules : ProxyRules;
	@:optional var pacScript : PacScript;
	var mode : PacScript;
}

@:require(chrome_ext)
@:native("chrome.proxy")
extern class Proxy {
	static var settings(default,null) : ChromeSetting;
	static var onProxyError(default,never) : Event<{fatal:Bool,error:String,details:String}->Void>;
}
