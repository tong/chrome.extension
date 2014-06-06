package chrome.system;

@:enum abstract StorageUnitType(String) {
	var fixed = "fixed";
	var removable = "removable";
	var unknown = "unknown";
}

typedef StorageUnitInfo = {
	var id : String;
	var name : String;
	var type : StorageUnitType;
	var capacity : Float;
}

@:enum abstract StorageEjectResult(String) {
	var success = "success";
	var in_use = "in_use";
	var no_such_device = "no_such_device";
	var failure = "failure";
}

@:require(chrome)
@:native('chrome.system.storage')
extern class Storage {
	static function getInfo( f : Array<StorageUnitInfo>->Void ) : Void;
	static function ejectDevice( id : String, f : StorageEjectResult->Void ) : Void;
	static function getAvailableCapacity( id : String, f : {id:String,availableCapacity:Float}->Void ) : Void;
	static var onAttached(default,null) : Event<StorageUnitInfo->Void>;
	static var onDetached(default,null) : Event<String->Void>;
}
