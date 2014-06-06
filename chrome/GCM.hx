package chrome;

@:require(chrome)
@:native("chrome.gcm")
extern class GCM {
	static var MAX_MESSAGE_SIZE(default,never) : Int;
	static function register( senderIds : Array<String>, f : String->Void ) : Void;
	static function unregister( f : Void->Void ) : Void;
	static function send( message : {destinationId:String,messageId:String,?timeToLive:Int,data:Dynamic}, f : String->Void ) : Void;
	static var onMessage(default,null) : Event<{data:Dynamic}->Void>;
	static var onMessagesDeleted(default,null) : Event<Void->Void>;
	static var onSendError(default,null) : Event<{errorMessage:String,?messageId:String,details:Dynamic}->Void>;
}