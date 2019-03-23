package chrome;

@:require(chrome)
@:native("chrome.i18n")
extern class I18n {
	static var LanguageCode : String;
	static function getAcceptLanguages( callback : Array<String>->Void ) : Void;
	static function getMessage( messageName : String, ?substitutions : Dynamic ) : String;
	static function getUILanguage() : String;
	static function detectLanguage( text : String, callback : {isReliable:Bool,languages:Array<{language:String,percentage:Int}>}->Void ) : String;
}
