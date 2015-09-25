package chrome;

import chrome.Events;

typedef FileHandlerExecuteEventDetails = {
	var entries : Array<Dynamic>;
	@:optional var tab_id : Int;
}

@:require(chrome_os)
@:native("chrome.fileBrowserHandler")
extern class FileBrowserHandler {
	static function selectFile( selectionParams : {suggestedName:String,?allowedFileExtensions:Array<String>}, callback : {success:Bool,?entry:Dynamic}->Void ) : Void;
	static var onExecute(default,never) : Event<String->FileHandlerExecuteEventDetails->Void>;
}
