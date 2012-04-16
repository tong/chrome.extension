package chrome;

typedef ResourceIdentifier = {
	var id : String;
	var description : Null<String>;
}

/**
	http://code.google.com/chrome/extensions/contentSettings.html
*/
typedef ContentSetting = {
	
	function clear(
		details : { ?scope : String },
		?cb : Void->Void
	) : Void;
	
	function get(
		details : {
			primaryUrl : String,
			?secondaryUrl : String,
			?resourceIdentifier : { id : String, ?description : String },
			?incognito : Bool
		},
		?cb : Void->Void
	) : Void;
	
	function getResourceIdentifiers(
		cb : Array<ResourceIdentifier>->Void
	) : Void;
	
	function set(
		details : {
			primaryPattern : String,
			?secondaryPattern : String,
			?resourceIdentifier : ResourceIdentifier,
			setting : Dynamic,
			?scope : String
		},
		?cb : Void->Void
	) : Void;
	
}
