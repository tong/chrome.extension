package chrome;

@:require(chrome_ext)
@:require(chrome_experimental)
@:native("chrome.infobars")
extern class Infobars {
	static function show( senderIds : {tabId:Int,path:String,?height:Int}, f : Window->Void ) : Void;
}