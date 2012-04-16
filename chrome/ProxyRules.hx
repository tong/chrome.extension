package chrome;

typedef ProxyRules = {
	?singleProxy : ProxyServer,
	?proxyForHttp : ProxyServer,
	?proxyForHttps : ProxyServer,
	?proxyForFtp : ProxyServer,
	?fallbackProxy : ProxyServer,
	?bypassList : Array<String>
}
