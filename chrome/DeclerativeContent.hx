package chrome;

import chrome.Events;

typedef PageStateMatcher = {
	@:optional var pageUrl : UrlFilter;
	@:optional var css : Array<String>;
}

typedef ShowPageAction = Dynamic;

@:require(chrome_ext)
@:native("chrome.declerativeContent")
extern class DeclerativeContent {
	static var onPageChanged(default,null) : Event<Dynamic>; //TODO
}
