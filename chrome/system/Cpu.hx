package chrome.system;

private typedef Processor = {
	var usage : {
		user : Float,
		kernel : Float,
		idle : Float,
		total : Float
	};
}

@:require(chrome)
@:native("chrome.system.cpu")
extern class Cpu {
	static function getInfo( f : {numOfProcessors:Int,archName:String,modelName:String,features:Array<String>,processors:Array<Processor>}->Void ) : Void;

}