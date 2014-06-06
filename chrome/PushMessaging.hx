package chrome;

typedef Message = {
	var subchannelId : Int;
	var payload : String;
}

typedef ChannelIdResult = {
	var channelId : Int;
}

@:require(chrome)
@:native("chrome.pushMessaging")
extern class PushMessaging {
	static function getChannelId( ?interactive : Bool, f : {channelId:String}->Void ) : Void;
	static var onMessage(default,null) : Event<Message->Void>;
}
