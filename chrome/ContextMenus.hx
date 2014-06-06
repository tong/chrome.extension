package chrome;

@:enum abstract ContextMenuType(String) {
	var normal = "normal";
	var checkbox = "checkbox";
	var radio = "radio";
	var separator = "separator";
}

@:enum abstract Contexts(String) {
	var all = "all";
	var page = "page";
	var frame = "frame";
	var selection = "selection";
	var link = "link";
	var editable = "editable";
	var image = "image";
	var video = "video";
	var audio = "audio";
	var launcher = "launcher";
}

typedef OnClickData = Dynamic; //TODO

@:require(chrome)
@:native("chrome.contextMenus")
extern class ContextMenus {
	
	static function create(
		createProperties : {
			?type : ContextMenuType,
			?id : String,
			?title : String,
			?checked : Bool,
			?contexts : Contexts,
			?onclick : {info:OnClickData,tab:Tab}->Void,
			?parentId : Int,
			?documentUrlPatterns : Array<String>,
			?targetUrlPatterns : Array<String>,
			?enabled : Bool
		},
		?f : Void->Void ) : Void;
	static function update(
		id : Int,
		updateProperties : {
			?type : ContextMenuType,
			?title : String,
			?checked : Bool,
			?contexts : Contexts,
			?onclick : Void->Void,
			?parentId : Int,
			?documentUrlPatterns : Array<String>,
			?targetUrlPatterns : Array<String>,
			?enabled : Bool
		},
		?f : Void->Void ) : Void;
	static function remove( menuItemId : Int, ?f : Void->Void ) : Void;
	static function removeAll( ?f : Void->Void ) : Void;

	var onClicked(default,null) : Event<Void->Void>;
}
