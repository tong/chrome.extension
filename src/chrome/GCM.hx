package chrome;

import chrome.Events;

@:require(chrome)
@:native("chrome.gcm")
extern class GCM {
	static var MAX_MESSAGE_SIZE(default,never) : Int;
	static function register( senderIds : Array<String>, f : String->Void ) : Void;
	static function unregister( f : Void->Void ) : Void;
	static function send( message : {destinationId:String,messageId:String,?timeToLive:Int,data:Dynamic}, f : String->Void ) : Void;
	static var onMessage(default,never) : Event<{data:Dynamic,?from:Strin,?collapseKey:String}->Void>;
	static var onMessagesDeleted(default,never) : Event<Void->Void>;
	static var onSendError(default,never) : Event<{errorMessage:String,?messageId:String,details:Dynamic}->Void>;
}
