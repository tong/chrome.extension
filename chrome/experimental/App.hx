package chrome.experimental;

@:native("chrome.experimental.app") extern class App {
	
	static function clearAllNotifications(
		?details : { ?extensionId : String },
		?cb : Void->Void
	) : Void;
	
	static function notify(
		details : {
			?extensionId : String,
			?title : String,
			?bodyText : String,
			?linkUrl : String,
			?linkText : String
		},
		?cb : Void->Void
	) : Void;
}
