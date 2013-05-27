package chrome;

typedef Command = {
	?name : String,
	?description : String,
	?shortcut : String
}

@:native("chrome.commands") extern class Commands {
	static function getAll( ?cb : Array<Command>->Void ) : Void;
	static var onCommand(default,null) : Event<String->Void>;
}
