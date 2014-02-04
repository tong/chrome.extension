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

@:require(chrome_ext)
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
	//static var onSpeak(default,null) : Event<String->Dynamic->(Void->Void)->Void>;
	//static var onStop(default,null) : Event<Void->Void>;
}
