package chrome;

@:enum abstract TtsGender(String) {
	var male = "male";
	var female = "female";
}

typedef TtsVoice = {
	@:optional var voiceName : String;
	@:optional var lang : String;
	@:optional var gender : TtsGender;
	@:optional var extensionId : String;
	@:optional var eventTypes : Array<String>;
}

@:enum abstract TtsEventType(String) {
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

typedef TtsEvent = {
	var type : TtsEventType;
	@:optional var charIndex : Float;
	@:optional var errorMessage : String;	
}

@:require(chrome)
@:native("chrome.tts")
extern class TTS {
	static function speak(
		utterance : String,
		?options : {
			?enqueue : Bool,
			?voiceName : String,
			?extensionId : String,
			?lang : String,
			?gender : TtsGender,
			?rate : Float,
			?pitch : Float,
			?volume : Float,
			?requiredEventTypes : Array<String>,
			?desiredEventTypes : Array<String>,
			?onEvent : TtsEvent->Void
		},
		?f : Void->Void
	) : Void;
	static function stop() : Void;
	static function pause() : Void;
	static function resume() : Void;
	static function isSpeaking( ?f : Bool->Void ) : Void;
	static function getVoices( ?f : Array<TtsVoice>->Void ) : Void;
}
