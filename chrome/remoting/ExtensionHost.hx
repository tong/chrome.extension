package chrome.remoting;

import haxe.remoting.Context;

class ExtensionHost {
	
	//public var id(default,null) : String;
	public var ctx : Context;
	
	var port : chrome.Port;
	
	public function new( ctx : Context ) {
		this.ctx = ctx;
		chrome.Extension.onConnect.addListener( handleContentScriptConnect );
	}
	
	function handleContentScriptConnect( port : chrome.Port ) {
//		if( port.name != id )
//			return;
		this.port = port;
		this.port.onMessage.addListener( handleContentScriptMessage );
	}
	
	function handleContentScriptMessage( data : String ) {
		processRequest( data, ctx );
		var response = processRequest( data, ctx );
		port.postMessage( response );
	}
	
	public static function processRequest( data : String, ctx : Context ) : String {
		try {
			var u = new haxe.Unserializer( data );
			var path = u.unserialize();
			var args = u.unserialize();
			var d = ctx.call( path, args );
			var s = new haxe.Serializer();
			s.serialize( d );
			return "hxr"+s.toString();
		} catch( e : Dynamic ) {
			var s = new haxe.Serializer();
			s.serializeException( e );
			return "hxr"+s.toString();
		}
	}
	
}
