package chrome;

@:enum abstract EventType(String) from String to String {
	var start = "start";
	var end = "end";
	var word = "word";
	var sentence = "sentence";
	var marker = "marker";
	var interrupted = "interrupted";
	var cancelled = "cancelled";
	var error = "error";
	var pause = "pause";
	var resume = "resume";
}

@:enum abstract VoiceGender(String) from String to String {
	var male = "male";
	var female = "female";
}

typedef TtsEvent = {
	var type : EventType;
	@:optional var charIndex : Float;
	@:optional var errorMessage : String;
	@:optional var length : Int;
}

typedef TtsVoice = {
	@:optional var voiceName : String;
	@:optional var lang : String;
	@:optional var remote : Bool;
	@:optional var extensionId : String;
	@:optional var eventTypes : Array<EventType>;
}

@:require(chrome)
@:native("chrome.tts")
extern class Tts {
	static function speak(
		utterance : String,
		?options : {
			?enqueue : Bool,
			?voiceName : String,
			?extensionId : String,
			?lang : String,
			?rate : Float,
			?pitch : Float,
			?volume : Float,
			?requiredEventTypes : Array<String>,
			?desiredEventTypes : Array<String>,
			?onEvent : TtsEvent->Void
		},
		?callback : Void->Void
	) : Void;
	static function stop() : Void;
	static function pause() : Void;
	static function resume() : Void;
	static function isSpeaking( ?callback : Bool->Void ) : Void;
	static function getVoices( ?callback : Array<TtsVoice>->Void ) : Void;
}
