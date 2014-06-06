package chrome;

@:enum abstract TemplateType(String) {
	var basic = "basic";
	var image = "image";
	var list = "list";
	var progress = "progress";
}

typedef NotificationButton = {
	var title : String;
	@:optional var iconUrl : String;
}

typedef NotificationItem = {
	var title : String;
	var message : String;
}

typedef NotificationOptions = {
	@:optional var type : TemplateType;
	@:optional var iconUrl : String;
	@:optional var title : String;
	@:optional var message : String;
	@:optional var contextMessage : String;
	@:optional var priority : Int;
	@:optional var eventTime : Float;
	@:optional var buttons : Array<NotificationButton>;
	@:optional var imageUrl : String;
	@:optional var items : Array<NotificationItem>;
	@:optional var progress : Int;
	@:optional var isClickable : Bool;
}

@:enum abstract PermissionLevel(String) {
	var granted = "granted";
	var denied = "denied";
}

@:require(chrome)
@:native("chrome.notifications")
extern class Notifications {
	static function create( notificationId : String, options : NotificationOptions, f : String->Void ) : Void;
	static function update( notificationId : String, options : NotificationOptions, f : Bool->Void ) : Void;
	static function clear( notificationId : String, f : Bool->Void ) : Void;
	static function getAll( f : Dynamic->Void ) : Void;
	static function getPermissionLevel( f : PermissionLevel->Void ) : Void;
	static var onClosed(default,never) : Event<String->Bool->Void>;
	static var onClicked(default,never) : Event<String->Void>;
	static var onButtonClicked(default,never) : Event<String->Int->Void>;
	static var onPermissionLevelChanged(default,never) : Event<PermissionLevel->Void>;
	static var onShowSettings(default,never) : Event<Void->Void>;
}
