package chrome;

import haxe.extern.EitherType;
import chrome.Events;
import chrome.Tabs;

@:enum abstract ItemType(String) from String to String {
	var normal = "normal";
	var checkbox = "checkbox";
	var radio = "radio";
	var separator = "separator";
}

@:enum abstract ContextType(String) from String to String {
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

@:require(chrome)
@:native("chrome.contextMenus")
extern class ContextMenus {

	static var ACTION_MENU_TOP_LEVEL_LIMIT(default,never) : Int;

	static function create(
		createProperties : {
			?type : ItemType,
			?id : String,
			?title : String,
			?checked : Bool,
			?contexts: Array<ContextType>,
			?onclick : {
				menuItemId : EitherType<Int,String>,
				?parentMenuItemId : EitherType<Int,String>,
				?mediaType : String,
				?linkUrl : String,
				?srcUrl : String,
				?pageUrl : String,
				?frameUrl : String,
				?selectionText : String,
				editable : Bool,
				?wasChecked : Bool,
				?checked : Bool,
			}->Tab->Void,
			?parentId : Int,
			?documentUrlPatterns : Array<String>,
			?targetUrlPatterns : Array<String>,
			?enabled : Bool
		},
		?callback : Void->Void ) : Void;

	static function update(
		id : EitherType<Int,String>,
		updateProperties : {
			?type : ItemType,
			?title : String,
			?checked : Bool,
			?contexts : Array<ContextType>,
			?onclick : {
					menuItemId : EitherType<Int,String>,
					?parentMenuItemId : EitherType<Int,String>,
					?mediaType : String,
					?linkUrl : String,
					?srcUrl : String,
					?pageUrl : String,
					?frameUrl : String,
					?selectionText : String,
					editable : Bool,
					?wasChecked : Bool,
					?checked : Bool
				}->Tab->Void,
			?parentId : Int,
			?documentUrlPatterns : Array<String>,
			?targetUrlPatterns : Array<String>,
			?enabled : Bool
		},
		?callback : Void->Void ) : Void;

	static function remove( menuItemId : EitherType<Int,String>, ?callback : Void->Void ) : Void;
	static function removeAll( ?callback : Void->Void ) : Void;

	static var onClicked(default,never) : Event<{
			menuItemId : EitherType<Int,String>,
			?parentMenuItemId : EitherType<Int,String>,
			?mediaType : String,
			?linkUrl : String,
			?srcUrl : String,
			?pageUrl : String,
			?frameUrl : String,
			?selectionText : String,
			editable : Bool,
			?wasChecked : Bool,
			?checked : Bool
		}->?Tab->Void>;
}
