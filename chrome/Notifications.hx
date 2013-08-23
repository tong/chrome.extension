package chrome;

typedef TemplateType = Dynamic;

typedef NotificationItem = {
	var title : String;
	var message : String;
}

typedef NotificationButton = {
	title : String,
	?iconUrl : String
}

typedef NotificationOptions = {
	type : TemplateType,
	iconUrl : String,
	title : String,
	message : String,
	?priority : Int,
	?eventTime : Float,
	?secondIconUrl : String,
	?buttons : Array<NotificationButton>,
	?expandedMessage : String,
	?imageUrl : String,
	?items : Array<NotificationItem>
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
