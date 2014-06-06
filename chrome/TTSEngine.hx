package chrome;

import chrome.TTS;

typedef TTSEngineListenerOptions = {
	@:optional var voiceName : String;
	@:optional var lang : String;
	@:optional var gender : TtsGender;
	@:optional var rate : Float;
	@:optional var pitch : Float;
	@:optional var volume : Float;
}

@:require(chrome)
@:native("chrome.ttsEngine")
extern class TTSEngine {
	static var onSpeak(default,never) : Event<String->TTSEngineListenerOptions->(TtsEvent->Void)->Void>;
	static var onStop(default,never) : Event<Void->Void>;
	static var onPause(default,never) : Event<Void->Void>;
	static var onResume(default,never) : Event<Void->Void>;
}
