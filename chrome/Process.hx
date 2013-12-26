package chrome;

@:fakeEnum(String)
enum ProcessType {
	browser;
	renderer;
	extension;
	notification;
	plugin;
	worker;
	nacl;
	utility;
	gpu;
	other;
}

private typedef Cache = {
	var size : Float;
	var liveSize : Float;
}

typedef Process = {
	var id : Int;
	var type : ProcessType;
	@:optional var cpu : Float;
	@:optional var network : Float;
	@:optional var privateMemory : Float;
	@:optional var jsMemoryAllocated : Float;
	@:optional var jsMemoryUsed : Float;
	@:optional var sqliteMemory : Float;
	@:optional var fps : Float;
	@:optional var imageCache : Cache;
	@:optional var scriptCache : Float;
	@:optional var cssCache : Float;
}
