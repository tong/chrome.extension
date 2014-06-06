package chrome;

@:enum abstract OS(String) {
	var mac = "mac";
	var win = "win";
	var android = "android";
	var cros = "cros";
	var linux = "linux";
	var openbsd = "openbsd";
}

@:enum abstract Arch(String) {
	var arm = "arm";
	var x86_32 = "x86-32";
	var x86_64 = "x86-64";
}

typedef PlatformInfo = {
	var os : OS;
	var arch : Arch;
	var nacl_arch : Arch;
}

@:enum abstract RestartReason(String) {
	var app_update = "app_update";
	var os_update = "os_update";
	var periodic = "periodic";
}

typedef DirectoryEntry = Dynamic; //TODO

@:enum abstract InstallReason(String) {
	var install = "install";
	var update = "update";
	var chrome_update = "chrome_update";
}

@:require(chrome)
@:native("chrome.runtime")
extern class Runtime {
	static var lastError : String;
	static var id : String;
	static function getBackgroundPage( f : Window->Void ) : Void;
	static function getManifest( f : Dynamic->Void ) : Void;
	static function getURL( path : String ) : String;
	static function setUninstallURL( url : String ) : Void;
	static function reload() : Void;
	static function requestUpdateCheck( f : String->Dynamic->Void ) : Void;
	static function restart() : Void;
	static function connect( ?extensionId : String, ?connectInfo : {?name:String,?includeTlsChannelId:Bool} ) : Port;
	static function connectNative( application : String ) : Port;
	static function sendMessage( ?extensionId : String, message : Dynamic, ?options : {?includeTlsChannelId:Bool}, f : Dynamic->Void ) : Port;
	static function sendNativeMessage( ?application : String, message : Dynamic, f : Dynamic->Void ) : Port;
	static function getPlatformInfo( f : PlatformInfo->Void ) : Port;
	static function getPackageDirectoryEntry( f : DirectoryEntry->Void ) : Port;
	static var onStartup(default,null) : Event<Void->Void>;
	static var onInstalled(default,null) : Event<{reason:InstallReason,?previousVersion:String}->Void>;
	static var onSuspend(default,null) : Event<Void->Void>;
	static var onSuspendCanceled(default,null) : Event<Void->Void>;
	static var onUpdateAvailable(default,null) : Event<{version:String}->Void>;
	static var onBrowserUpdateAvailable(default,null) : Event<Void->Void>;
	static var onConnect(default,null) : Event<Port->Void>;
	static var onConnectExternal(default,null) : Event<Port->Void>;
	static var onMessage(default,null) : Event<Dynamic->MessageSender->{sendResponse:Void->Void}->Void>;
	static var onMessageExternal(default,null) : Event<Dynamic->MessageSender->{sendResponse:Void->Void}->Void>;
	static var onRestartRequired(default,null) : Event<RestartReason->Void>;
}
