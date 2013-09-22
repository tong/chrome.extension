package chrome;

typedef OnClickData = {
	var menuItemId : Int;
	@:optional var parentMenuItemId : Int;
	@:optional var mediaType : String;
	@:optional var linkUrl : String;
	@:optional var srcUrl : String;
	var pageUrl : String;
	@:optional var frameUrl : String;
	@:optional var selectionText : String;
	var editable : String;
}

/*
@:fakeEnum(String) private enum Context {
	 all;
	 page;
	 frame;
	 selection;
	 link;
	 editable;
	 image;
	 video;
	 audio;
	 launcher;
}
*/

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
