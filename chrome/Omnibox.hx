package chrome;

typedef SuggestResult = {
	var content : String;
	var description : String;
}

@:native("chrome.omnibox") extern class Omnibox {
	static function setDefaultSuggestion( suggestion : Dynamic ) : Void;
	static var onInputCancelled(default,null) : Event<Void->Void>;
	static var onInputChanged(default,null) : Event<String->(Array<SuggestResult>->Void)->Void>;
	static var onInputEntered(default,null) : Event<String->Void>;
	static var onInputStarted(default,null) : Event<Void->Void>;
}
