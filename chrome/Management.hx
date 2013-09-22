package chrome;

typedef IconInfo = {
	var size : Int;
	var url : String;
}

@:fakeEnum(String) enum DisabledReason {
	unknown;
	permissions_increase;
}

@:fakeEnum(String) private enum ExtensionType {
	extension;
	hosted_app;
	packaged_app;
	legacy_packaged_app;
	theme;
}

@:fakeEnum(String) private enum ExtensionInstallType {
	admin;
	development;
	normal;
	sideload;
	other;
}

typedef ExtensionInfo = {
	var id : String;
	var name : String;
	var shortName : String;
	var description : String;
	var version : String;
	var mayDisable : Bool;
	var enabled : Bool;
	var disabledReason : Null<DisabledReason>;
	var type : ExtensionType;
	@:optional var appLaunchUrl : String;
	@:optional var homepageUrl : String;
	@:optional var updateUrl : String;
	var offlineEnabled : Bool;
	var optionsUrl : String;
	@:optional var icons : Array<IconInfo>;
	var permissions : Array<String>;
	var hostPermissions : Array<String>;
	var installType : ExtensionInstallType;
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
