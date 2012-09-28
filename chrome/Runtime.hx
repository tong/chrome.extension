package chrome;

typedef ManifestDetails = {
	version : String,
	name : String,
	?manifest_version : Int,
	?permissions : Array<String>
}

@:native("chrome.runtime") extern class Runtime {
	
	static var lastError(default,null) : { ?message : String };
	static var id(default,null) : String;
	
	static function getBackgroundPage( cb : Dynamic->Void ) : Void;
	static function getManifest( cb : ManifestDetails->Void ) : Void;
	static function getURL( path : String ) : String;
	
	static var onInstalled : Event<Void->Void>;
	static var onSuspend : Event<Void->Void>;
	static var onSuspendCanceled : Event<Void->Void>;
}
