package chrome;

typedef FileHandlerExecuteEventDetails = {
	var entries : Array<Dynamic>;
	@:optional var tab_id : Null<Int>;
}

@:require(chrome)
@:require(chrome_os)
@:native("chrome.fileBrowserHandler")
extern class FileBrowserHandler {
	static function selectFile( selectionParams : {suggestedName:String,?allowedFileExtensions:Array<String>}, f : {success:Bool,?entry:Dynamic}->Void ) : Void;
	static var onExecute(default,never) : Event<String->FileHandlerExecuteEventDetails->Void>;
}
