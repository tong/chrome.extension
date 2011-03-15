package chrome;

@:native("webkitNotifications") extern class Notifications {
	static function createHTMLNotification( url : String ) : Notifications; 
	static function createNotification( icon : String, title : String, content : String ) : Notifications; 
	//static function checkPermissions() : Int;
	//static function requestPermission() : Void;
	function show() : Void;
	function cancel() : Void;
}
