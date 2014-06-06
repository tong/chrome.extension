package chrome;

typedef Command = {
	@:optional var name : String;
	@:optional var description : String;
	@:optional var shortcut : String;
}

@:require(chrome)
@:native("chrome.commands")
extern class Commands {
	static function getAll( ?f : Array<Command>->Void ) : Void;
	static var onCommand(default,null) : Event<String->Void>;
}
