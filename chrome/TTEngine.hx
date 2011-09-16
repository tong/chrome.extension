package chrome;

@:native("chrome.ttsEngine") extern class TTSEngine {
	static var onSpeak : Event<String->Dynamic->(Void->Void)->Void>;
	static var onSpeak : Event<Void->Void>;
}
