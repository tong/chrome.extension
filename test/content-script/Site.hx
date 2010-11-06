
class Site {
	
	static function init() {
		var output = js.Lib.document.getElementById( "output" );
		var ext = new chrome.ExtensionConnection( "hx-chrome" );
		ext.onMessage = function(m:String){ output.innerHTML += m; }
		ext.send( "Hello extension!" );
	}
	
}
