package chrome;

typedef SuggestResult = {
	var content : String;
	var description : String;
}

private typedef Suggestion = {
	var description : String;
}

/**
	http://code.google.com/chrome/extensions/omnibox.html
*/
@:native("chrome.omnibox") extern class Omnibox {
	
	static function setDefaultSuggestion( suggestion : Suggestion ) : Void;
	
	static var onInputCancelled(default,never) : Event<Void->Void>;
	static var onInputChanged(default,never) : Event<String->(Array<SuggestResult>->Void)->Void>;
	static var onInputEntered(default,never) : Event<String->Void>;
	static var onInputStarted(default,never) : Event<Void->Void>;
}
