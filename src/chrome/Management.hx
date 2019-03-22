package chrome;

import chrome.Events;

typedef IconInfo = {
	var size : Int;
	var url : String;
}

@:enum abstract LaunchType(String) from String to String {
	var OPEN_AS_REGULAR_TAB = "OPEN_AS_REGULAR_TAB";
	var OPEN_AS_PINNED_TAB = "OPEN_AS_PINNED_TAB";
	var OPEN_AS_WINDOW = "OPEN_AS_WINDOW";
	var OPEN_FULL_SCREEN = "OPEN_FULL_SCREEN";
}

@:enum abstract ExtensionDisabledReason(String) from String to String {
	var unknown = "unknown";
	var permissions_increase = "permissions_increase";
}

@:enum abstract ExtensionType(String) from String to String {
	var extension = "extension";
	var hosted_app = "hosted_app";
	var packaged_app = "packaged_app";
	var legacy_packaged_app = "legacy_packaged_app";
	var theme = "theme";
}

@:enum abstract ExtensionInstallType(String) from String to String {
	var admin = "admin";
	var development = "development";
	var normal = "normal";
	var sideload = "sideload";
	var other = "other";
}

typedef ExtensionInfo = {
	var id : String;
	var name : String;
	var shortName : String;
	var description : String;
	var version : String;
	@:optional var versionName : String;
	var mayDisable : Bool;
	@:optional var mayEnable : Bool;
	var enabled : Bool;
	@:optional var disabledReason : ExtensionDisabledReason;
	var isApp : Bool;
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
	@:optional var launchType : LaunchType;
	@:optional var availableLaunchTypes : Array<LaunchType>;
}

@:require(chrome_ext)
@:native("chrome.management")
extern class Management {
	static function getAll( ?callback : Array<ExtensionInfo>->Void ) : Void;
	static function get( id : String, ?callback : ExtensionInfo->Void ) : Void;
	static function getSelf( ?callback : ExtensionInfo->Void ) : Void;
	static function getPermissionWarningsById( id : String, ?callback : Array<String>->Void ) : Void;
	static function getPermissionWarningsByManifest( manifestStr : String, ?callback : Array<String>->Void ) : Void;
	static function setEnabled( id : String, enabled : Bool, ?callback : Void->Void ) : Void;
	static function uninstall( id : String, ?options : { ?showConfirmDialog : Bool }, ?callback : Void->Void ) : Void;
	static function uninstallSelf( ?options : { ?showConfirmDialog : Bool }, ?callback : Void->Void ) : Void;
	static function launchApp( id : String, ?callback : Void->Void ) : Void;
	static function createAppShortcut( id : String, ?callback : Void->Void ) : Void;
	static function setLaunchType( id : String, launchType : LaunchType, ?callback : Void->Void ) : Void;
	static function generateAppForLink( url : String, title : String, ?callback : ExtensionInfo->Void ) : Void;
	static var onInstalled(default,never) : Event<ExtensionInfo->Void>;
	static var onUninstalled(default,never) : Event<String->Void>;
	static var onEnabled(default,never) : Event<ExtensionInfo->Void>;
	static var onDisabled(default,never) : Event<ExtensionInfo->Void>;
}
