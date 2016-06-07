package chrome.system;

typedef Processor = {
	var usage : {
		user : Float,
		kernel : Float,
		idle : Float,
		total : Float
	};
}

@:enum abstract ProcessorFeature(String) from String to String {
	var mmx = "mmx";
	var sse = "sse";
	var sse2 = "sse2";
	var sse3 = "sse3";
	var sse4_1 = "sse4_1";
	var sse4_2 = "sse4_2";
	var avx = "avx";
}

@:require(chrome)
@:native("chrome.system.cpu")
extern class Cpu {
	static function getInfo( callback : {numOfProcessors:Int,archName:String,modelName:String,features:Array<ProcessorFeature>,processors:Array<Processor>}->Void ) : Void;

}
