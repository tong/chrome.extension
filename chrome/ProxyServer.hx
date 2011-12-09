package chrome;

typedef ProxyServer = {
	var scheme : String; // optional enumerated string ["http", "https", "socks4", "socks5"]
	var host : String;
	var port : Int;
}
