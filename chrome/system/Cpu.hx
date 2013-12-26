package chrome.system;

@:require(chrome_ext)
@:require(chrome_experimental)
@:native("chrome.system.cpu")
extern class Cpu {
	static function getInfo( f : {numOfProcessors:Int,archName:String,modelName:String}->Void ) : Void;

}