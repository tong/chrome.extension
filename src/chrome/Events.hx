package chrome;

import haxe.extern.EitherType;

@:require(chrome)
typedef Rule = {
	@:optional var id : String;
	@:optional var tags : Array<String>;
	var conditions : Array<Dynamic>;
	var actions : Array<Dynamic>;
	@:optional var priority : Int;
}

@:require(chrome)
typedef Event<T> = {
	function addListener( callback : T ) : Void;
	function removeListener( f : T ) : Void;
	function hasListener( f : T ) : Bool;
	function hasListeners( f : T ) : Bool;
	function addRules( rules : Array<Rule>, ?callback : Array<Rule>->Void ) : Void;
	function getRules( ?ruleIdentifiers : Array<String>, callback : Array<Rule>->Void ) : Void;
	function removeRules( ?ruleIdentifiers : Array<String>, callback : Void->Void ) : Void;
}

@:require(chrome)
typedef UrlFilter = {
	@:optional var hostContains : String;
	@:optional var hostEquals : String;
	@:optional var hostPrefix : String;
	@:optional var hostSuffix : String;
	@:optional var pathContains : String;
	@:optional var pathEquals : String;
	@:optional var pathPrefix : String;
	@:optional var pathSuffix : String;
	@:optional var queryContains : String;
	@:optional var queryEquals : String;
	@:optional var queryPrefix : String;
	@:optional var querySuffix : String;
	@:optional var urlContains : String;
	@:optional var urlEquals : String;
	@:optional var urlMatches : String;
	@:optional var originAndPathMatches : String;
	@:optional var urlPrefix : String;
	@:optional var urlSuffix : String;
	@:optional var schemes : Array<String>;
	@:optional var ports : Array<EitherType<Int,Array<Int>>>;
}
