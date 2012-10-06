package chrome.app;

typedef AppWindow = {
	function restore() : Void;
	function moveTo() : Void;
	function minimize() : Void;
	function maximize() : Void;
	function focus() : Void;
	var contentWindow : Dynamic;
	function resizeTo() : Void;
	
}

typedef CreateWindowOptions = {
	?defaultLeft : Int,
	?maxWidth : Int,
	?defaultWidth : Int,
	?top : Int,
	?minHeight : Int,
	?maxHeight . Int,
	?height : Int,
	?minWidth : Int,
	?width : Int,
	?defaultHeight : Int,
	?id : String,
	?type : String,
	?frame : String,
	?left : Int
}

@:native("chrome.app.window")
extern class Window {
	static function current() : AppWindow;
	static function create( url : String, ?options : CreateWindowOptions, ?cb : AppWindow->Void ) : Void;
	
}
