package chrome.experimental;

@:native("chrome.experimental.discovery")
extern class Discovery {
	static function suggest( details : { linkText : String, linkUrl : String, ?urlImage : String, ?score : Float } ) : Void;
	static function removeSuggestion( linkUrl : String ) : Void;
	static function clearAllSuggestions() : Void;
}
