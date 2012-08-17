package chrome.input;

private typedef KeyboardEvent = {
	var type(default,null) : String; // enumerated string ["keyup", "keydown"] 
	var requestId(default,null) : String;
	var key(default,null) : String;
	var altKey(default,null) : Bool;
	var ctrlKey(default,null) : Bool;
	var shiftKey(default,null) : Bool;
}

private typedef InputContext = {
	var contextID(default,null) : Int;
	var type(default,null) : Int; // enumerated string ["text", "number", "password"]
}

@:native("chrome.input.ime") extern class Ime {

	static function clearComposition( parameters : { contextID : Int }, ?cb : Bool->Void ) : Void;
	
	static function commitText( parameters : { contextID : Int, text : String }, ?cb : Bool->Void ) : Void;
	
	static function setCandidateWindowProperties(
		parameters : {
			engineID : String,
			properties : {
				?visible : Bool,
				?cursorVisible : Bool,
				?vertical : Bool,
				?pageSize : Int,
				?auxiliaryText : String,
				?auxiliaryTextVisible : Bool
			}
		},
		?cb : Bool->Void
	) : Void;
	
	static function setCandidates(
		parameters : {
			contextID : Int,
			candidates : Array<{
				candidate : String,
				id : Int,
				?parentId : Int,
				?label : String,
				?annotation : String
			}>
		},
		?cb : Bool->Void
	) : Void;
	
	static function setComposition(
		parameters : {
			contextID : Int,
			text : String,
			?selectionStart : Int,
			?selectionEnd : Int,
			cursor : Int,
			?segments : Array<{
				start : Int,
				end : Int,
				style : String
			}>,
		},
		?cb : Bool->Void
	) : Void;
	
	static function setCursorPosition(
		parameters : {
			contextID : Int,
			candidateID : Int
		},
		?cb : Bool->Void
	) : Void;
	
	static function setMenuItems(
		parameters : {
			engineID : String,
			items : Array<{
				id : String,
				?label : String,
				?style : String,
				?visible : Bool,
				?checked : Bool,
				?enabled : Bool
			}>
		},
		?cb : Void->Void
	) : Void;
	
	static function updateMenuItems(
		parameters : {
			engineID : String,
			items : Array<{
				id : String,
				?label : String,
				?style : String,
				?visible : Bool,
				?checked : Bool,
				?enabled : Bool
			}>
		},
		?cb : Void->Void
	) : Void;
	
	static var onActivate(default,null) : Event<String->Void>;
	static var onBlur(default,null) : Event<Int->Void>;
	static var onCandidateClicked(default,null) : Event<String->Int->String->Void>;
	static var onFocus(default,null) : Event<InputContext->Void>;
	static var onInputContextUpdate(default,null) : Event<InputContext->Void>;
	static var onKeyEvent(default,null) : Event<String->KeyboardEvent->Void>;
	static var onMenuItemActivated(default,null) : Event<String->String->Void>;
}
