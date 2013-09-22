package chrome;

typedef TemplateType = Dynamic;

typedef NotificationItem = {
	var title : String;
	var message : String;
}

typedef NotificationButton = {
	var title : String;
	@:optional var iconUrl : String;
}

typedef NotificationOptions = {
	var type : TemplateType;
	var iconUrl : String;
	var title : String;
	var message : String;
	@:optional var priority : Int;
	@:optional var eventTime : Float;
	@:optional var secondIconUrl : String;
	@:optional var buttons : Array<NotificationButton>;
	@:optional var expandedMessage : String;
	@:optional var imageUrl : String;
	@:optional var items : Array<NotificationItem>;
}

@:native("chrome.notifications") extern class Notifications {
	static function create( notificationId : String, options : NotificationOptions, f : String->Void ) : Void;
	static function update( notificationId : String, options : NotificationOptions, f : String->Void ) : Void;
	static function clear( notificationId : String, f : String->Void ) : Void;
	static var onDisplayed : Event<String->Void>;
	static var onClosed : Event<String->Bool->Void>;
	static var onClicked : Event<String->Void>;
	static var onButtonClicked : Event<String->Int->Void>;
}
