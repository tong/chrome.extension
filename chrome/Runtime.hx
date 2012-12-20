package chrome;

typedef ManifestDetails = {
	version : String,
	name : String,
	?manifest_version : Int,
	?permissions : Array<String>
}

@:native("chrome.runtime") extern class Runtime {
	
	/***/
	static var lastError(default,null) : { ?message : String };
	
	/** The ID of the extension/app. */
	static var id(default,null) : String;
	
	/** Retrieves the JavaScript 'window' object for the background page running inside the current extension. */
	static function getBackgroundPage( cb : Dynamic->Void ) : Void;
	
	/** Returns details about the app or extension from the manifest. The object returned is a serialization of the full manifest file. */
	static function getManifest( cb : ManifestDetails->Void ) : Void;
	
	/** Converts a relative path within an app/extension install directory to a fully-qualified URL. */
	static function getURL( path : String ) : String;
	
	/** Fired when the browser first starts up */
	static var onStartup : Event<Void->Void>;
	
	/** Fired when the extension is first installed, and on each update to a new version */
	static var onInstalled : Event<Void->Void>;
	
	/** Sent to the event page just before it is unloaded. */
	static var onSuspend : Event<Void->Void>;
	
	/** Sent after onSuspend() to indicate that the app won't be unloaded after all. */
	static var onSuspendCanceled : Event<Void->Void>;
	
}
