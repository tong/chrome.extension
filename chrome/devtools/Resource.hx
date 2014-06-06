package chrome.devtools;

@:require(chrome_ext)
@:native('chrome.devtools.resource')
extern class Resource {
	static var url : String;
	static function getContent( f : String->String->Void ) : Void;
	static function setContent( content : String, commit : Bool, ?f : Dynamic->Void ) : Void;
}
