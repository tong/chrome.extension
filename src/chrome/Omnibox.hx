package chrome;

import chrome.Events;

@:enum abstract DescriptionStyleType(String) from String to String {
	var url = "url";
	var match = "match";
	var dim = "dim";
}

@:enum abstract OnInputEnteredDisposition(String) from String to String {
	var currentTab = "currentTab";
	var newForegroundTab = "newForegroundTab";
	var newBackgroundTab = "newBackgroundTab";
}

typedef SuggestResult = {
	var content : String;
	var description : String;
}

@:require(chrome_ext)
@:native("chrome.omnibox")
extern class Omnibox {
	static function setDefaultSuggestion( suggestion : {suggestion:String} ) : Void;
	static var onInputStarted(default,never) : Event<Void->Void>;
	static var onInputChanged(default,never) : Event<String->(Array<SuggestResult>->Void)->Void>;
	static var onInputEntered(default,never) : Event<String->String->Void>;
	static var onInputCancelled(default,never) : Event<Void->Void>;
}
