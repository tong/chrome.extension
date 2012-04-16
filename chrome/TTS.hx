package chrome;

@:fakeEnum(String) enum TtsGender {
	male;
	female;
}

typedef TtsVoice = {
	?voiceName : String,
	?lang : String,
	?gender : TtsGender,
	?extensionId : String,
	?eventTypes : Array<String>,
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
	type : TtsEventType,
	?charIndex : Float,
	?errorMessage : String	
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
