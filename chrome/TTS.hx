package chrome;

@:fakeEnum(String) enum TtsGender {
	male;
	female;
}

typedef TtsVoice = {
	@:optional var voiceName : String;
	@:optional var lang : String;
	@:optional var gender : TtsGender;
	@:optional var extensionId : String;
	@:optional var eventTypes : Array<String>;
}

@:fakeEnum(String) enum TtsEventType {
	start;
	end;
	word;
	sentence;
	marker;
	interrupted;
	cancelled;
	error;
}

typedef TtsEvent = {
	var type : TtsEventType;
	@:optional var charIndex : Float;
	@:optional var errorMessage : String;	
}

/**
 * http://code.google.com/chrome/extensions/tts.html
 */
@:native("chrome.tts") extern class TTS {
	static function getVoices( ?cb : Array<TtsVoice>->Void ) : Void;
	static function isSpeaking( ?cb : Bool->Void ) : Void;
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
		?cb : Void->Void
	) : Void;
	static function stop() : Void;
	static var onSpeak : Event<String->Dynamic->(Void->Void)->Void>;
	static var onStop : Event<Void->Void>;
}
