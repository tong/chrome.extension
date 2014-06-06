package chrome.input;

@:enum abstract KeyboardEventType(String) {
	var keyup = "keyup";
	var keydown = "keydown";
}

typedef KeyboardEvent = {
	var type : KeyboardEventType;
	var requestId : String;
	@:optional var extensionId : String;
	var key : String;
	var code : String;
	@:optional var altKey : Bool;
	@:optional var ctrlKey : Bool;
	@:optional var shiftKey : Bool;
	@:optional var capsLock : Bool;
}

@:enum abstract InputContextType(String) {
	var text = "text";
	var search = "search";
	var tel = "tel";
	var url = "url";
	var email = "email";
	var number = "number";
}

typedef InputContext = {
	var contextID : Int;
	var type : InputContextType;
}

@:enum abstract MenuItemStyle(String) {
	var check = "check";
	var radio = "radio";
	var separator = "separator";
}

typedef MenuItem = {
	var id : String;
	@:optional var label : String;
	@:optional var style : MenuItemStyle;
	@:optional var visible : Bool;
	@:optional var checked : Bool;
	@:optional var enabled : Bool;
}

@:enum abstract SegmentStyle(String) {
	var underline = "underline";
	var doubleUnderline = "doubleUnderline";
}

@:enum abstract WindowPosition(String) {
	var cursor = "cursor";
	var composition = "composition";
}

@:enum abstract MouseButton(String) {
	var left = "left";
	var middle = "middle";
	var right = "right";
}

@:require(chrome_ext)
@:native("chrome.input.ime")
extern class Ime {
	static function setComposition( parameters : { contextID : Int, text : String, ?selectionStart : Int, ?selectionEnd : Int,cursor : Int, ?segments : Array<{start:Int,end:Int,style:SegmentStyle}>, }, ?f : Bool->Void ) : Void;
	static function clearComposition( parameters : { contextID : Int }, ?f : Bool->Void ) : Void;
	static function commitText( parameters : { contextID : Int, text : String }, ?f : Bool->Void ) : Void;
	static function sendKeyEvents( parameters : { contextID : Int, keyData : Array<KeyboardEvent> }, ?f : Void->Void ) : Void;
	static function hideInputView() : Void;
	static function setCandidateWindowProperties( parameters : {?visible:Bool,?cursorVisible:Bool,?vertial:Bool,?pageSize:Int,?auxiliaryText:String,?auxiliaryTextVisible:Bool,?windowPosition:WindowPosition}, ?f : Bool->Void ) : Void;
	static function setCandidates( parameters : {contextID:Int,candidates:Array<{candidate:String,id:Int,?parentId:Int,?label:String,?annotation:String,?usage:Dynamic}>}, ?f : Bool->Void ) : Void;
	static function setCursorPosition( parameters : { contextID : Int, candidateID : Int },?f : Bool->Void ) : Void;
	static function setMenuItems( parameters : { engineID : String, items : Array<MenuItem> }, ?f : Void->Void ) : Void;
	static function updateMenuItems( parameters : { engineID : String, items : Array<MenuItem> }, ?f : Void->Void ) : Void;
	static function deleteSurroundingText( parameters : { engineID : String, contextID : Int, offset : Int, length : Int }, ?f : Void->Void ) : Void;
	static function keyEventHandled( requestId : String, response : Bool ) : Void;
	static var onActivate(default,null) : Event<String->Void>;
	static var onDeactivated(default,null) : Event<String->Void>;
	static var onFocus(default,null) : Event<InputContext->Void>;
	static var onBlur(default,null) : Event<Int->Void>;
	static var onInputContextUpdate(default,null) : Event<InputContext->Void>;
	static var onKeyEvent(default,null) : Event<String->KeyboardEvent->Void>;
	static var onCandidateClicked(default,null) : Event<String->Int->MouseButton->Void>;
	static var onMenuItemActivated(default,null) : Event<String->String->Void>;
	static var onSurroundingTextChanged(default,null) : Event<String->{text:String,focus:Int,anchor:Int}->Void>;
	static var onReset(default,null) : Event<String->Void>;
}
