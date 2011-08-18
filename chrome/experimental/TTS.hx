package chrome.experimental;

@:native("chrome.experimental.tts") extern class TTS {

	static function isSpeaking( cb : Bool->Void ) : Void;
	static function speak( utterance : String, options : Dynamic, cb : Void->Void ) : Void;
	static function stop() : Void;
	static var onSpeak : Event<String->Dynamic->(Void->Void)->Void>;
	static var onStop : Event<Void->Void>;
}
