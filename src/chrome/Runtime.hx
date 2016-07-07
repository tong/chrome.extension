package chrome;

import chrome.Events;
import chrome.Tabs;

typedef MessageSender = {
	@:optional var tab : Tab;
	@:optional var frameId : Int;
	@:optional var id : String;
	@:optional var url : String;
	@:optional var tlsChannelId : String;
}

typedef Port = {
	var name : String;
	var disconnect : Void->Void;
	var onDisconnect : Dynamic;
	var onMessage : Dynamic;
	var postMessage : Dynamic->Void;
	@:optional var sender : Void->Void;
}

@:enum abstract PlatformOs(String) from String to String {
	var mac = "mac";
	var win = "win";
	var android = "android";
	var cros = "cros";
	var linux = "linux";
	var openbsd = "openbsd";
}

@:enum abstract PlatformArch(String) from String to String {
	var arm = "arm";
	var x86_32 = "x86-32";
	var x86_64 = "x86-64";
}

@:enum abstract PlatformNaclArch(String) from String to String {
	var arm = "arm";
	var x86_32 = "x86-32";
	var x86_64 = "x86-64";
}

typedef PlatformInfo = {
	var os : PlatformOs;
	var arch : PlatformArch;
	var nacl_arch : PlatformNaclArch;
}

@:enum abstract RequestUpdateCheckStatus(String) from String to String {
	var throttled = "throttled";
	var no_update = "no_update";
	var update_available = "update_available";
}

@:enum abstract OnInstalledReason(String) from String to String {
	var install = "install";
	var update = "update";
	var shared_module_update = "shared_module_update";
}

@:enum abstract OnRestartRequiredReason(String) from String to String {
	var app_update = "app_update";
	var os_update = "os_update";
	var periodic = "periodic";
}

typedef DirectoryEntry = Dynamic; //TODO

@:require(chrome)
@:native("chrome.runtime")
extern class Runtime {
	static var lastError : {?message:String};
	static var id : String;
	static function getBackgroundPage( callback : js.html.Window->Void ) : Void;
	static function openOptionsPage( ?callback : Void->Void ) : Void;
	static function getManifest( callback : Dynamic->Void ) : Void;
	static function getURL( path : String ) : String;
	static function setUninstallURL( url : String, ?callback : Void->Void ) : Void;
	static function reload() : Void;
	static function requestUpdateCheck( callback : RequestUpdateCheckStatus->?{version:String}->Void ) : Void;
	static function restart() : Void;
	static function connect( ?extensionId : String, ?connectInfo : {?name:String,?includeTlsChannelId:Bool} ) : Port;
	static function connectNative( application : String ) : Port;
	static function sendMessage( ?extensionId : String, message : Dynamic, ?options : {?includeTlsChannelId:Bool}, ?callback : Dynamic->Void ) : Port;
	static function sendNativeMessage( ?application : String, message : Dynamic, ?callback : Dynamic->Void ) : Port;
	static function getPlatformInfo( callback : PlatformInfo->Void ) : Port;
	static function getPackageDirectoryEntry( callback : DirectoryEntry->Void ) : Port;
	static var onStartup(default,never) : Event<Void->Void>;
	static var onInstalled(default,never) : Event<{reason:OnInstalledReason,?previousVersion:String,?id:String}->Void>;
	static var onSuspend(default,never) : Event<Void->Void>;
	static var onSuspendCanceled(default,never) : Event<Void->Void>;
	static var onUpdateAvailable(default,never) : Event<{version:String}->Void>;
	//static var onBrowserUpdateAvailable(default,never) : Event<Void->Void>;
	static var onConnect(default,never) : Event<Port->Void>;
	static var onConnectExternal(default,never) : Event<Port->Void>;
	static var onMessage(default,never) : Event<?Dynamic->MessageSender->(Void->Void)->Void>;
	static var onMessageExternal(default,never) : Event<?Dynamic->MessageSender->(Void->Void)->Void>;
	static var onRestartRequired(default,never) : Event<OnRestartRequiredReason->Void>;
}
