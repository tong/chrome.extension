package chrome;

typedef IconInfo = {
	var size : Int;
	var url : String;
}

@:fakeEnum(String) enum DisabledReason {
	unknown;
	permissions_increase;
}

typedef ExtensionInfo = {
	var id : String;
	var name : String;
	var version : String;
	var enabled : Bool;
	var disabledReason : Null<DisabledReason>;
	var isApp : Bool;
	var appLaunchUrl : Null<String>;
	var homepageUrl : Null<String>;
	var updateUrl : Null<String>;
	var offlineEnabled : Bool;
	var optionsUrl : String;
	var icons : Null<Array<IconInfo>>;
	var permissions : Array<String>;
	var hostPermissions : Array<String>;
}

/**
	http://code.google.com/chrome/extensions/management.html
*/
@:native("chrome.management") extern class Management {
	
	static function get( id : String, ?cb : ExtensionInfo->Void ) : Void;
	static function getAll( ?cb : ExtensionInfo->Void ) : Void;
	static function getPermissionWarningsById( id : String, ?cb : Array<String>->Void ) : Void;
	static function getPermissionWarningsByManifest( manifestStr : String, ?cb : Array<String>->Void ) : Void;
	static function launchApp( id : String, ?cb : Void->Void ) : Void;
	static function setEnabled( id : String, enabled : Bool, ?cb : Void->Void ) : Void;
	static function uninstall( id : String, ?options : { ?showConfirmDialog : Bool }, ?cb : Void->Void ) : Void;
	
	static var onDisabled(default,null) : Event<ExtensionInfo->Void>;
	static var onEnabled(default,null) : Event<ExtensionInfo->Void>;
	static var onInstalled(default,null) : Event<ExtensionInfo->Void>;
	static var onUninstalled(default,null) : Event<String->Void>;
}
