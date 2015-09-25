package chrome;

typedef ResourceIdentifier = {
	var id : String;
	@:optional var description : String;
}

@:enum abstract Scope(String) from String to String{
	var regular = "regular";
	var incognito_session_only = "incognito_session_only";
}

@:require(chrome_ext)
@:native("chrome.contentSetting")
extern class ContentSetting {

	static var cookies(default,never) : String;
	static var images(default,never) : String;
	static var javascript(default,never) : String;
	static var plugins(default,never) : String;
	static var popups(default,never) : String;
	static var notifications(default,never) : String;

	static function clear( details : { ?scope : Scope }, ?callback : Void->Void ) : Void;
	static function get( details : { primaryUrl : String, secondaryUrl : String, ?resourceIdentifier : ResourceIdentifier, ?incognito : Bool }, callback : Dynamic->Void ) : Void;
	static function set( details : { primaryPattern : String, secondaryPattern : String, ?resourceIdentifier : ResourceIdentifier, setting : Dynamic, ?scope : Scope }, callback : Dynamic->Void ) : Void;
	static function getResourceIdentifiers( callback : Array<ResourceIdentifier>->Void ) : Void;
}
