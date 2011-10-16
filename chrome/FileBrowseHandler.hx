package chrome;

typedef FileHandlerExecuteEventDetails = {
	var entries : Array<Dynamic>;
	var tab_id : Int;
}

/**
	This API works only on Chrome OS
*/
@:native("chrome.fileBrowserHandler") extern class FileBrowserHandler {
	static var onExecute(default,null) : Event<String->FileHandlerExecuteEventDetails->Void>;
}
