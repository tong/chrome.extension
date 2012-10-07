package chrome;

typedef UrlFilter = {
	?schemes : Array<String>,
	?pathContains : String,
	?urlContains : String,
	?hostPrefix : String,
	?hostContains : String,
	?hostSuffix : String,
	?pathSuffix : String,
	?urlPrefix : String,
	?hostEquals : String,
	?querySuffix : String,
	?queryContains : String,
	?pathPrefix : String,
	?pathEquals : String,
	?urlEquals : String,
	?queryEquals : String,
	?queryPrefix : String,
	?urlSuffix : String,
	?ports : Array<Int>
}

typedef Rule = {
	?priority : Int,
	conditions : Array<Dynamic>,
	?id : String,
	?actions : Array<Dynamic>
}

typedef Event<T> = {

	function addListener( a : Dynamic, ?b : Dynamic, ?c : Dynamic, ?d : Dynamic, ?e : Dynamic ) : Void;
	function removeListener( cb : T ) : Void;
	function hasListener( cb : T ) : Void;
	
	function getRules( ?ruleIdentifiers : Array<String>, cb : Array<Rule>->Void ) : Void;
	function removeRules( ?ruleIdentifiers : Array<String>, cb : Void->Void ) : Void;
	function addRules( rules : Array<Rule>, ?cb : Array<Rule>->Void ) : Void;
}
