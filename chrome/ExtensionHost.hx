package chrome;

/**
*/
class ExtensionHost {
	
	/** */
	public dynamic function onMessage( t : String ) {}
	
	var port : chrome.Port;
	
	/**
	*/
	public function new( ?onMessage : String->Void ) {
		this.onMessage = onMessage;
		chrome.Extension.onConnect.addListener( handleContentScriptConnect );
	}
	
	/**
	*/
	public function send( t : String ) {
		if( port == null )
			throw 'chrome extension not connected';
		port.postMessage( t );
	}
	
	/*
	public function dispose() {
	//TODO
	}
	*/
	
	function handleContentScriptConnect( port : chrome.Port ) {
		this.port = port;
		this.port.onMessage.addListener( handleContentScriptMessage );
		//TODO this.port.onDisconnect.addListener( function(){} );
	}
	
	function handleContentScriptMessage( t : String ) {
		onMessage( t );
	}
	
}
