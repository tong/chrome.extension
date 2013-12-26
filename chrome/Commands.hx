package chrome;

typedef Command = {
	@:optional var name : String;
	@:optional var description : String;
	@:optional var shortcut : String;
}

@:require(chrome_ext)
@:native("chrome.commands")
extern class Commands {
	static function getAll( ?cb : Array<Command>->Void ) : Void;
	static var onCommand(default,null) : Event<String->Void>;
}
