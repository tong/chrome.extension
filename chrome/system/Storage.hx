package chrome.system;

@:fakeEnum(String) enum StorageUnitType {
	fixed;
	removable;
	unknown;
}

typedef StorageUnitInfo = {
	var id : String;
	var name : String;
	var type : StorageUnitType;
	var capacity : Float;
}

typedef StorageChangeInfo = {
	var availableCapacity : Float;
	var id : String;
}

@:fakeEnum(String) enum StorageEjectResult {
	success;
	in_use;
	no_such_device;
	failure;
}

@:require(chrome)
@:native('chrome.system.storage')
extern class Storage {
	static function getInfo( cb : Array<StorageUnitInfo>->Void ) : Void;
	static function ejectDevice( id : String, cb : StorageEjectResult->Void ) : Void;
	static var onAttached(default,null) : Event<StorageUnitInfo->Void>;
	static var onDetached(default,null) : Event<String->Void>;
}
