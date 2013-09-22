package chrome;

typedef ProxyRules = {
	@:optional var singleProxy : ProxyServer;
	@:optional var proxyForHttp : ProxyServer;
	@:optional var proxyForHttps : ProxyServer;
	@:optional var proxyForFtp : ProxyServer;
	@:optional var fallbackProxy : ProxyServer;
	@:optional var bypassList : Array<String>;
}
