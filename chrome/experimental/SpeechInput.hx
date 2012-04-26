package chrome.experimental;

typedef SpeechInputStartOptions = {
	var language : String;
	var grammar : String;
	var filterProfanities : Bool;
}

typedef SpeechInputResultHypothesis = {
	var utterance : String;
	var confidence : Float;
}

typedef SpeechInputResultEvent = {
	var hypotheses : Array<SpeechInputResultHypothesis>;
}

typedef SpeechInputError = {
	var code : String;
}

@:native("chrome.experimental.speechInput") extern class SpeechInput {
	
	static function isRecording( ?cb : Bool->Void ) : Void;
	static function start( ?options : SpeechInputStartOptions, ?cb : Void->Void ) : Void;
	static function stop( ?cb : Void->Void ) : Void;
	
	static var onError : Event<SpeechInputError->Void>;
	static var onResult : Event<SpeechInputResultEvent->Void>;
	static var onSoundEnd : Event<Void->Void>;
	static var onSoundStart : Event<Void->Void>;
}

