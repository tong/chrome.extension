package chrome;

@:require(chrome_ext)
@:native("chrome.i18n")
extern class I18n {
	static function getAcceptLanguages( cb : Array<String>->Void ) : Void;
	@:overload(function( messageName : String, ?substitutions : Array<String> ) : Void {} )
	static function getMessage( messageName : String, ?substitutions : String ) : String;
}
