package chrome;

import js.html.ImageData;
import haxe.extern.EitherType;
import chrome.Events;

typedef PageStateMatcherArgs = {
	@:optional var pageUrl : {
		?hostContains : String,
		?hostEquals : String,
		?hostPrefix : String,
		?hostSuffix : String,
		?pathContains : String,
		?pathEquals : String,
		?pathPrefix : String,
		?pathSuffix : String,
		?queryContains : String,
		?queryEquals : String,
		?queryPrefix : String,
		?querySuffix : String,
		?urlContains : String,
		?urlEquals : String,
		?urlMatches : String,
		?originAndPathMatches : String,
		?urlPrefix : String,
		?urlSuffix : String,
		?schemes : Array<String>,
		?ports : Array<Int>
	};
	@:optional var css : Array<String>;
}

typedef SetIcon = {
	@:optional var imageData : EitherType<ImageData,Dynamic>;
};

typedef RequestContentScript = {
	@:optional var css : Array<String>;
	@:optional var js : Array<String>;
	@:optional var allFrames : Bool;
	@:optional var matchAboutBlank : Bool;
}

@:require(chrome_ext)
@:native("chrome.declarativeContent")
extern class DeclarativeContent {
	static var onPageChanged(default,never) : Event<Dynamic>; //TODO
}

@:require(chrome_ext)
@:native("chrome.declarativeContent.PageStateMatcher")
extern class PageStateMatcher {
	public function new(properties : PageStateMatcherArgs) {}
}

@:require(chrome_ext)
@:native("chrome.declarativeContent.ShowPageAction")
extern class ShowPageAction {
	public function new() {}
}
