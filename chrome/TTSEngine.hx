package chrome;

import chrome.TTS;

typedef TTSEngineListenerOptions = {
	?voiceName : String,
	?lang : String,
	?gender : TtsGender,
	?rate : Float,
	?pitch : Float,
	?volume : Float,
}

/**
 * http://code.google.com/chrome/extensions/ttsEngine.html
 */
@:native("chrome.ttsEngine") extern class TTSEngine {
	static var onSpeak : Event<String->TTSEngineListenerOptions->(TtsEvent->Void)->Void>;
	static var onStop : Event<Void->Void>;
}
