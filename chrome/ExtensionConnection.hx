package chrome;

import js.Dom;

/**
	Connection to communicate with a chrome extension (from websites)
*/
class ExtensionConnection {
	
	/** Extension sends data callback */
	public dynamic function onMessage( t : String ) {}
	
	var div : Dynamic; // js.HtmlDom;
	var event : js.Event;
	
	public function new( id : String, divName : String = "ext_com" ) {
		event = untyped document.createEvent( 'Event' );
		untyped event.initEvent( 'chrome.site.event', true, true );
		div = js.Lib.document.getElementById( divName );
		div.addEventListener( 'chrome.extension.event', handleContentScriptEvent );
	}
	
	public function send( t : String ) {
		div.innerText = t;
		div.dispatchEvent( event );
	}
	
	function handleContentScriptEvent() {
		onMessage( div.innerText );
	}
	
}
