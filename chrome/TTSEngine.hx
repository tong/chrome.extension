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

/**
 * http://code.google.com/chrome/extensions/ttsEngine.html
 */
@:native("chrome.ttsEngine") extern class TTSEngine {
	static var onSpeak : Event<String->TTSEngineListenerOptions->(TtsEvent->Void)->Void>;
	static var onStop : Event<Void->Void>;
}
