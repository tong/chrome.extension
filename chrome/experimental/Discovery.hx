package chrome.experimental;

@:native("chrome.experimental.discovery") extern class Discovery {
	static function clearAllSuggestions() : Void;
	static function removeSuggestion( linkUrl : String ) : Void;
	static function suggest( details : { linkText : String, linkUrl : String, ?score : Float } ) : Void;
}
