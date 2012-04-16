package chrome;

@:fakeEnum(String) enum Scheme {
	http;
	https;
	socks4;
	socks5;
}

typedef ProxyServer = {
	scheme : Scheme,
	host : String,
	?port : Int
}
