package chrome.experimental;

private typedef CreateProperties = {
	url : String,
	?width : Int,
	?height : Int
}

typedef OffscreenTab = {
	var id : String;
	var url : String;
	var width : Int;
	var height : Int;
}

@:fakeEnum(String) private enum ToDataURLOptionsFormat {
	jpeg;
	png;
}

private typedef ToDataURLOptions = {
	?format : ToDataURLOptionsFormat,
	?quality : Int
}

private typedef UpdateProperties = {
	?url : String,
	?width : Int,
	?height: Int
}

private typedef ChangeInfo = {
	?url : String
}

@:fakeEnum(String) private enum KeyboardEventType {
	keypress;
	keydown;
	keyup;
}

private typedef KeyboardEvent = {
	type : KeyboardEventType,
	charCode : Int,
	keyCode : Int,
	altKey : Bool,
	ctrlKey : Bool,
	shiftKey : Bool,
	?metaKey : Bool
}

@:fakeEnum(String) private enum MouseEventType {
	mousedown;
	mouseup;
	click;
	mousemove;
	mousewheel;
}

private typedef MouseEvent = {
	type : MouseEventType,
	?button : Bool,
	?wheelDeltaX : Int,
	?wheelDeltaY : Int,
	altKey : Bool,
	ctrlKey : Bool,
	shiftKey : Bool,
	?metaKey : Bool
}

@:native("chrome.experimental.offscreenTabs") extern class OffscreenTabs {
	
	static function create( createProperties : CreateProperties, ?cb : OffscreenTab->Void ) : Void;
	static function get( offscreenTabId : Int, cb : OffscreenTab->Void ) : Void;
	static function getAll( cb : Array<OffscreenTab>->Void ) : Void;
	static function remove( offscreenTabId : Int, ?cb : Void->Void ) : Void;
	static function sendKeyboardEvent( offscreenTabId : Int, keyboardEvent : KeyboardEvent, ?cb : Void->Void ) : Void;
	static function sendMouseEvent( offscreenTabId : Int, mouseEvent : MouseEvent, ?position : {x:Int,y:Int}, ?cb : Void->Void ) : Void;
	static function toDataUrl( offscreenTabId : Int, ?options : ToDataURLOptions, cb : String->Void ) : Void;
	static function update( offscreenTabId : Int, ?updateProperties : UpdateProperties, cb : Void->Void ) : Void;
	
	static var onUpdated : Event<Int->ChangeInfo->OffscreenTab>;
}
