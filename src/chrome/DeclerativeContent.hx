package chrome;

import js.html.ImageData;
import haxe.extern.EitherType;
import chrome.Events;

typedef PageStateMatcher = {
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

typedef ShowPageAction = Dynamic;

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
@:native("chrome.declerativeContent")
extern class DeclerativeContent {
	static var onPageChanged(default,never) : Event<Dynamic>; //TODO
}
