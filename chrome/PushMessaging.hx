package chrome;

typedef Message = {
	var subchannelId : Int;
	var payload : String;
}

typedef ChannelIdResult = {
	var channelId : Int;
}

@:require(chrome_ext)
@:native("chrome.pushMessaging")
extern class PushMessaging {
	static function getChannelId( ?interactive : Bool, cb : ChannelIdResult->Void ) : Void;
	static var onMessage(default,null) : Event<Message->Void>;
}
