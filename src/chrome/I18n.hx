package chrome;

@:require(chrome)
@:native("chrome.i18n")
extern class I18n {
	static function getAcceptLanguages( callback : Array<String>->Void ) : Void;
	static function getMessage( messageName : String, ?substitutions : Dynamic ) : String;
	static function getUILanguage() : String;
}
