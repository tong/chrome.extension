package chrome;

typedef UrlFilter = {
	@:optional var schemes : Array<String>;
	@:optional var pathContains : String;
	@:optional var urlContains : String;
	@:optional var hostPrefix : String;
	@:optional var hostContains : String;
	@:optional var hostSuffix : String;
	@:optional var pathSuffix : String;
	@:optional var urlPrefix : String;
	@:optional var hostEquals : String;
	@:optional var querySuffix : String;
	@:optional var queryContains : String;
	@:optional var pathPrefix : String;
	@:optional var pathEquals : String;
	@:optional var urlEquals : String;
	@:optional var queryEquals : String;
	@:optional var queryPrefix : String;
	@:optional var urlSuffix : String;
	@:optional var ports : Array<Int>;
}

typedef Rule = {
	@:optional var priority : Int;
	var conditions : Array<Dynamic>;
	@:optional var id : String;
	@:optional var actions : Array<Dynamic>;
}

typedef Event<T> = {
	function addListener( a : Dynamic, ?b : Dynamic, ?c : Dynamic, ?d : Dynamic, ?e : Dynamic ) : Void;
	function removeListener( cb : T ) : Void;
	function hasListener( cb : T ) : Void;
	function getRules( ?ruleIdentifiers : Array<String>, cb : Array<Rule>->Void ) : Void;
	function removeRules( ?ruleIdentifiers : Array<String>, cb : Void->Void ) : Void;
	function addRules( rules : Array<Rule>, ?cb : Array<Rule>->Void ) : Void;
}
