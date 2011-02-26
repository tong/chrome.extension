package chrome;

typedef ProxyRules = {
	var singleProxy : ProxyServer;
	var proxyForHttp : ProxyServer;
	var proxyForHttps : ProxyServer;
	var proxyForFtp : ProxyServer;
	var socksProxy : ProxyServer;
}
