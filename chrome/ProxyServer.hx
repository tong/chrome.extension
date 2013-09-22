package chrome;

@:fakeEnum(String) enum Scheme {
	http;
	https;
	socks4;
	socks5;
}

typedef ProxyServer = {
	@:optional var scheme : Scheme;
	var host : String;
	@:optional var port : Int;
}
