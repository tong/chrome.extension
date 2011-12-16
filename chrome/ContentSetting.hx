package chrome;

typedef ResourceIdentifier = {
	var id : String;
	var description : String; // optional
}

private typedef GetDetails = {
	var primaryUrl : String;
	var secondaryUrl : String; // optional
	var resourceIdentifier : ResourceIdentifier; // optional
	var incognito : Bool; // optional
}

private typedef SetDetails = {
	var primaryPattern : String;
	var secondaryPattern : String; // optional
	var resourceIdentifier : ResourceIdentifier; // optional
	var setting : Dynamic;
	var scope : String; // optional // enumerated string ["regular", "incognito_session_only"]
}

@:native("chrome.contentSetting") extern class ContentSetting {
	static function clear( details : { scope : String }, ?cb : Void->Void ) : Void;
	static function get( details : GetDetails, ?cb : Void->Void ) : Void;
	static function getResourceIdentifiers( cb : Array<ResourceIdentifier>->Void ) : Void;
	static function set( details : SetDetails, ?cb : Void->Void ) : Void;
}
