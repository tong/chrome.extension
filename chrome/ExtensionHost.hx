package chrome;

class ExtensionHost {
	
	public dynamic function onMessage( t : String ) : Void;
	
	var port : chrome.Port;
	
	public function new( ?onMessage : String->Void ) {
		this.onMessage = onMessage;
		chrome.Extension.onConnect.addListener( handleContentScriptConnect );
	}
	
	public function send( t : String ) {
		if( port == null )
			throw "Chrome extension not connected";
		port.postMessage( t );
	}
	
	function handleContentScriptConnect( port : chrome.Port ) {
		this.port = port;
		this.port.onMessage.addListener( handleContentScriptMessage );
	}
	
	function handleContentScriptMessage( t : String ) {
		onMessage( t );
	}
	
}
