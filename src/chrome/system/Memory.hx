package chrome.system;

@:require(chrome)
@:native("chrome.system.memory")
extern class Memory {
	static function getInfo( callback : {capacity:Float,availableCapacity:Float}->Void ) : Void;

}
