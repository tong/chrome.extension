package chrome;

import chrome.Events;
import chrome.TTS;

typedef TTSEngineListenerOptions = {
	?voiceName : String,
	?lang : String,
	?rate : Float,
	?pitch : Float,
	?volume : Float
}

@:require(chrome)
@:native("chrome.ttsEngine")
extern class TTSEngine {
	static function updateVoices( voices : Array<TtsVoice> ) : Void;
	static var onSpeak(default,never) : Event<String->TTSEngineListenerOptions->(TtsEvent->Void)->Void>;
	static var onStop(default,never) : Event<Void->Void>;
	static var onPause(default,never) : Event<Void->Void>;
	static var onResume(default,never) : Event<Void->Void>;
}
