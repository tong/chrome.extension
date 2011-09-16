package chrome;

typedef TtsVoice = {
	var voiceName : String;
	var lang : String;
	var gender : String;
	var extensionId : String;
	var eventTypes : String;
}

@:native("chrome.tts") extern class TTS {
	static function getVoices( ?cb : Array<TtsVoice>->Void ) : Void;
	static function isSpeaking( ?cb : Bool->Void ) : Void;
	static function speak( utterance : String, ?options : Dynamic, ?cb : Void->Void ) : Void;
	static function stop() : Void;
	static var onSpeak : Event<String->Dynamic->(Void->Void)->Void>;
	static var onStop : Event<Void->Void>;
}
