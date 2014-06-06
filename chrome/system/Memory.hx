package chrome.system;

@:require(chrome)
@:native("chrome.system.memory")
extern class Memory {
	static function getInfo( f : {capacity:Float,availableCapacity:Float}->Void ) : Void;

}