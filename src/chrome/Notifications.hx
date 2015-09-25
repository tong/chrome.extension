package chrome;

import chrome.Events;

@:enum abstract TemplateType(String) from String to String {
	var basic = "basic";
	var image = "image";
	var list = "list";
	var progress = "progress";
}

@:enum abstract PermissionLevel(String) from String to String {
	var granted = "granted";
	var denied = "denied";
}

typedef NotificationOptions = {
	@:optional var type : TemplateType;
	@:optional var iconUrl : String;
	@:optional var appIconMaskUrl : String;
	@:optional var title : String;
	@:optional var message : String;
	@:optional var contextMessage : String;
	@:optional var priority : Int;
	@:optional var eventTime : Float;
	@:optional var buttons : Array<{title:String,?iconUrl:String}>;
	@:optional var imageUrl : String;
	@:optional var items : Array<{title:String,message:String}>;
	@:optional var progress : Int;
	@:optional var isClickable : Bool;
}
/*
typedef NotificationButton = {
	var title : String;
	@:optional var iconUrl : String;
}

typedef NotificationItem = {
	var title : String;
	var message : String;
}
*/

@:require(chrome)
@:native("chrome.notifications")
extern class Notifications {
	static function create( notificationId : String, options : NotificationOptions, callback : String->Void ) : Void;
	static function update( notificationId : String, options : NotificationOptions, callback : Bool->Void ) : Void;
	static function clear( notificationId : String, callback : Bool->Void ) : Void;
	static function getAll( callback : Dynamic->Void ) : Void;
	static function getPermissionLevel( callback : PermissionLevel->Void ) : Void;
	static var onClosed(default,never) : Event<String->Bool->Void>;
	static var onClicked(default,never) : Event<String->Void>;
	static var onButtonClicked(default,never) : Event<String->Int->Void>;
	static var onPermissionLevelChanged(default,never) : Event<PermissionLevel->Void>;
	static var onShowSettings(default,never) : Event<Void->Void>;
}
