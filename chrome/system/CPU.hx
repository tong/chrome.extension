package chrome.system;

@:require(chrome_experimental)
@:native("chrome.system.cpu")
extern class CPU {
	static function getInfo( f : {numOfProcessors:Int,archName:String,modelName:String}->Void ) : Void;

}