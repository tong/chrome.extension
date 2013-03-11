package chrome;

typedef Command = {
	?name : String,
	?description : String,
	?shortcut : String
}

@:native("chrome.commands") class Commands {
	static function getAll( ?cb : Array<Command>->Void ) : Void;
	static var onCommand(default,null) : EventDispatcher<String->Void>;
}
