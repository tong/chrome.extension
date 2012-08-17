package chrome;

typedef OnClickData = {
	menuItemId : Int,
	?parentMenuItemId : Int,
	?mediaType : String,
	?linkUrl : String,
	?srcUrl : String,
	pageUrl : String,
	?frameUrl : String,
	?selectionText : String,
	editable : String
}

@:native("chrome.contextMenus") extern class ContextMenus {
	
	static function create( 
		createProperties : {
			?type : String,
			?title : String,
			?checked : Bool,
			?contexts : Array<String>,
			?onclick : OnClickData->Tab->Void,
			?parentId : Int,
			?documentUrlPatterns : Array<String>,
			?targetUrlPatterns : Array<String>,
			?enabled : Bool
		},
		?cb : Void->Void
	) : Int;
	
	static function remove(
		menuItemId : Int,
		?cb : Void->Void
	) : Void;
	
	static function removeAll( ?cb : Void->Void ) : Void;
	
	static function update(
		id : Int,
		updateProperties : {
			?type : String,
			?title : String,
			?checked : Bool,
			?contexts : String,
			?onclick : Void->Void,
			?parentId : Int,
			?documentUrlPatterns : Array<String>,
			?targetUrlPatterns : Array<String>,
			?enabled : Bool
		},
		?cb : Void->Void
	) : Void;
	
}
