package chrome;

/**
	http://code.google.com/chrome/extensions/i18n.html
*/
@:native("chrome.i18n") extern class I18n {
	static function getAcceptLanguages( cb : Array<String>->Void ) : Void;
	@:overload(function( messageName : String, ?substitutions : Array<String> ) : Void {} )
	static function getMessage( messageName : String, ?substitutions : String ) : String;
}
