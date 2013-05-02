package chrome;

typedef ManifestDetails = {
	version : String,
	name : String,
	?manifest_version : Int,
	?permissions : Array<String>
}

@:fakeEnum(String) enum RequestUpdateCheck {
	throttled;
	no_update;
	update_available;
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

	/** Reloads the app or extension */
	static function reload() : Void;

	/** Requests an update check for this app/extension */
	static function requestUpdateCheck( f : RequestUpdateCheck->Dynamic->Void ) : Void;

	/** Attempts to connect to other listeners within the extension/app */
	static function connect( extensionId : String, connectInfo : Dynamic ) : Port;

	/** Connects to a native application in the host machine */
	static function connectNative( application : String ) : Port;

	/**  Sends a single message to onMessage event listeners within the extension (or another extension/app) */
	static function sendMessage( ?extensionId : String, message : Dynamic, ?f : Dynamic->Void ) : Port;

	/** Send a single message to a native application */
	static function sendNativeMessage( application : String, message : Dynamic, ?f : Dynamic->Void ) : Port;

	/** Fired when the browser first starts up */
	static var onStartup : Event<Void->Void>;
	
	/** Fired when the extension is first installed, and on each update to a new version */
	static var onInstalled : Event<Void->Void>;
	
	/** Sent to the event page just before it is unloaded. */
	static var onSuspend : Event<Void->Void>;
	
	/** Sent after onSuspend() to indicate that the app won't be unloaded after all. */
	static var onSuspendCanceled : Event<Void->Void>;
	
	/** Fired when an update is available, but isn't installed immediately because the app is currently running */
	static var onUpdateAvailable : Event<Dynamic->Void>;
	
	/** Fired when a Chrome update is available, but isn't installed immediately because a browser restart is required */
	static var onBrowserUpdateAvailable : Event<Dynamic->Void>;
	
	/** Fired when a connection is made from either an extension process or a content script */
	static var onConnect : Event<Port->Void>;
	
	/** Fired when a connection is made from another extension */
	static var onConnectExternal : Event<Port->Void>;

	/** Fired when a message is sent from either an extension process or a content script. */
	static var onMessage : Event<Dynamic->MessageSender->Dynamic->Void>;

}
