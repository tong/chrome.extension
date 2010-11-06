
class Extension {
	
	static function init() {
		var host = new chrome.ExtensionHost();
		host.onMessage = function(m:String){
			host.send( "Hi website!" );
		};
	}
	
}
