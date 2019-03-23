package chrome.input;

import chrome.Events;

@:enum abstract KeyboardEventType(String) from String to String {
	var keyup = "keyup";
	var keydown = "keydown";
}

typedef KeyboardEvent = {
	var type : KeyboardEventType;
	var requestId : String;
	@:optional var extensionId : String;
	var key : String;
	var code : String;
	@:optional var keyCode : Int;
	@:optional var altKey : Bool;
	@:optional var ctrlKey : Bool;
	@:optional var shiftKey : Bool;
	@:optional var capsLock : Bool;
}

@:enum abstract InputContextType(String) from String to String {
	var text = "text";
	var search = "search";
	var tel = "tel";
	var url = "url";
	var email = "email";
	var number = "number";
	var password = "password";
}

@:enum abstract AutoCapitalizeType(String) from String to String {
	var characters = "characters";
	var words = "words";
	var sentences = "sentences";
}

typedef InputContext = {
	var contextID : Int;
	var type : InputContextType;
	var autoCorrect : Bool;
	var autoComplete : Bool;
	var autoCapitalize : AutoCapitalizeType;
	var spellCheck : Bool;
	var shouldDoLearning : Bool;
}

@:enum abstract MenuItemStyle(String) from String to String {
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

@:enum abstract UnderlineStyle(String) from String to String {
	var underline = "underline";
	var doubleUnderline = "doubleUnderline";
	var noUnderline = "noUnderline";
}

@:enum abstract WindowPosition(String) from String to String {
	var cursor = "cursor";
	var composition = "composition";
}

@:enum abstract ScreenType(String) from String to String {
	var normal = "normal";
	var login = "login";
	var lock = "lock";
	var secondary_login = "secondary-login";
}

/*
@:enum abstract CallbackStyle(String) from String to String {
	//TODO is missing in documentation
	var async = "async";
}
*/

@:enum abstract MouseButton(String) from String to String {
	var left = "left";
	var middle = "middle";
	var right = "right";
}

@:enum abstract WindowType(String) from String to String {
	var normal = "normal";
	var followCursor = "followCursor";
}

typedef Bounds = {
	var left : Int;
	var top : Int;
	var width : Int;
	var height : Int;
}

typedef CreateWindowOptions = {
	var windowType : WindowType;
	@:optional var url : String;
	@:optional var bounds : Bounds;
}

@:require(chrome_ext)
@:native("chrome.input.ime")
extern class Ime {
	static function setComposition(
		parameters : {
			contextID : Int,
			text : String,
			?selectionStart : Int,
			?selectionEnd : Int,
			cursor : Int,
			?segments : Array<{start:Int,end:Int,style:UnderlineStyle}>,
		}, ?callback : Bool->Void ) : Void;
	static function clearComposition( parameters : { contextID : Int }, ?callback : Bool->Void ) : Void;
	static function commitText( parameters : { contextID : Int, text : String }, ?callback : Bool->Void ) : Void;
	static function sendKeyEvents( parameters : { contextID : Int, keyData : Array<KeyboardEvent> }, ?callback : Void->Void ) : Void;
	static function hideInputView() : Void;
	static function setCandidateWindowProperties(
		parameters : {
			?visible:Bool,
			?cursorVisible:Bool,
			?vertial:Bool,
			?pageSize:Int,
			?auxiliaryText:String,
			?auxiliaryTextVisible:Bool,
			?windowPosition:WindowPosition
		}, ?callback : Bool->Void ) : Void;
	static function setCandidates(
		parameters : {
			contextID:Int,
			candidates:Array<{candidate:String,id:Int,?parentId:Int,?label:String,?annotation:String,?usage:Dynamic}>
		}, ?callback : Bool->Void ) : Void;
	static function setCursorPosition( parameters : { contextID : Int, candidateID : Int },?callback : Bool->Void ) : Void;
	static function setMenuItems( parameters : { engineID : String, items : Array<MenuItem> }, ?callback : Void->Void ) : Void;
	static function updateMenuItems( parameters : { engineID : String, items : Array<MenuItem> }, ?callback : Void->Void ) : Void;
	static function deleteSurroundingText( parameters : { engineID : String, contextID : Int, offset : Int, length : Int }, ?callback : Void->Void ) : Void;
	static function keyEventHandled( requestId : String, response : Bool ) : Void;
	static function createWindow( options : CreateWindowOptions, callback : js.html.Window->Void ) : Void;
	static function showWindow( windowId : Int, ?callback : Void->Void ) : Void;
	static function hideWindow( windowId : Int, ?callback : Void->Void ) : Void;
	static function activate( ?callback : Void->Void ) : Void;
	static function deactivate( ?callback : Void->Void ) : Void;
	static var onActivate(default,never) : Event<String->ScreenType->Void>;
	static var onDeactivated(default,never) : Event<String->Void>;
	static var onFocus(default,never) : Event<InputContext->Void>;
	static var onBlur(default,never) : Event<Int->Void>;
	static var onInputContextUpdate(default,never) : Event<InputContext->Void>;
	static var onKeyEvent(default,never) : Event<String->KeyboardEvent->Void>;
	static var onCandidateClicked(default,never) : Event<String->Int->MouseButton->Void>;
	static var onMenuItemActivated(default,never) : Event<String->String->Void>;
	static var onSurroundingTextChanged(default,never) : Event<String->{text:String,focus:Int,anchor:Int,offset:Int}->Void>;
	static var onReset(default,never) : Event<String->Void>;
	static var onCompositionBoundsChanged(default,never) : Event<Array<Bounds>->Void>;
}
