package chrome;

private typedef IconInfo = {
	var size : Int;
	var url : String;
}
	
private typedef ExtensionInfo = {
	var id : String;
	var name : String;
	var version : String;
	var enabled : Bool;
	var isApp : Bool;
	var appLaunchUrl : String;
	var homepageUrl : String;
	var optionsUrl : String;
	var icons : Array<IconInfo>;
}

@:native("chrome.management") extern class Management {
	static function get( id : String, cb : ExtensionInfo->Void ) : Void;
	static function getAll( cb : ExtensionInfo->Void ) : Void;
	static function launchApp( id : String, ?cb : Void->Void ) : Void;
	static function setEnabled( id : String, enabled : Bool, ?cb : Void->Void ) : Void;
	static function uninstall( id : String, ?cb : Void->Void ) : Void;
	static var onDisabled(default,null) : Event<ExtensionInfo->Void>;
	static var onEnabled(default,null) : Event<ExtensionInfo->Void>;
	static var onInstalled(default,null) : Event<ExtensionInfo->Void>;
	static var onUninstalled(default,null) : Event<String->Void>;
}
