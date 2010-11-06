
class Extension {
	
	static var inst : Extension;
	
	function new() {}
	
	public function foo( x : Int, y : Int ) : Int {
		return x+y;
	}
	
	static function init() {
		inst = new Extension();
		var ctx = new haxe.remoting.Context();
		ctx.addObject( "inst", inst );
		var hxr = new chrome.remoting.ExtensionHost( ctx );
	}
	
}
