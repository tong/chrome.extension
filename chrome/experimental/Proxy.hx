package chrome.experimental;

@:native("chrome.experimental.proxy") extern class Proxy {
	static function useCustomProxySettings( config : chrome.ProxyConfig ) : Void;
}
