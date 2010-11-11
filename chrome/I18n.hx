package chrome;

@:native("chrome.i18n") extern class I18n {
	static function getAcceptLanguages( cb : Array<String>->Void ) : Void;
	static function getMessage( messageName : String, ?substitutions : Dynamic ) : String;
}
