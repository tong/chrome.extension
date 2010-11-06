
private class ExtensionProxy extends haxe.remoting.AsyncProxy<Extension> {} 

class Site {
	
	static var output : Dynamic;
	
	static function display(t) {
		output.innerHTML = t;
	}
	
	static function init() {
		
		output = js.Lib.document.getElementById( "output" );
		
		/*
		// haXe-remoting
		var cnx = chrome.remoting.ExtensionConnection.connect( "inst" );
		cnx.setErrorHandler( function(err) trace( "ERROR : "+Std.string(err) ) );
		try {
			cnx.inst.foo.call( [2,3], display );
		} catch( e: Dynamic ) {
			trace(e);
		}
		*/
		
		/// haXe-remoting proxy
		var cnx = chrome.remoting.ExtensionConnection.connect( "inst" );
		cnx.setErrorHandler( function(err) trace( "ERROR: "+Std.string(err) ) );
		var ext = new ExtensionProxy( cnx.inst );
		ext.foo( 2, 3, function(r:Int) {
			output.innerHTML = Std.string(r);
		} );
		
	}
	
}
