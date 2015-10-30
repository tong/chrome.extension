package chrome.system;

import chrome.Events;

@:enum abstract StorageUnitType(String) from String to String {
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

@:enum abstract StorageEjectResult(String) from String to String {
	var success = "success";
	var in_use = "in_use";
	var no_such_device = "no_such_device";
	var failure = "failure";
}

@:require(chrome)
@:native('chrome.system.storage')
extern class Storage {
	static function getInfo( callback : Array<StorageUnitInfo>->Void ) : Void;
	static function ejectDevice( id : String, callback : StorageEjectResult->Void ) : Void;
	@:require(chrome_dev)
	static function getAvailableCapacity( id : String, callback : {id:String,availableCapacity:Float}->Void ) : Void;
	static var onAttached(default,never) : Event<StorageUnitInfo->Void>;
	static var onDetached(default,never) : Event<String->Void>;
}
