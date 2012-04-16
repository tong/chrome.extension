package chrome;

typedef FileHandlerExecuteEventDetails = {
	var entries : Array<Dynamic>;
	var tab_id : Null<Int>;
}

/**
	This API works only on Chrome OS
	http://code.google.com/chrome/extensions/fileBrowserHandler.html
*/
@:native("chrome.fileBrowserHandler") extern class FileBrowserHandler {
	static var onExecute(default,never) : Event<String->FileHandlerExecuteEventDetails->Void>;
}
