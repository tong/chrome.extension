package chrome;

import chrome.Events;

@:require(chrome)
typedef Event<T> = {
	function addListener( a : Dynamic, ?b : Dynamic, ?c : Dynamic, ?d : Dynamic, ?e : Dynamic ) : Void;
	function removeListener( f : T ) : Void;
	function hasListener( f : T ) : Bool;
	function hasListeners( f : T ) : Bool;
	function addRules( rules : Array<Rule>, ?f : Array<Rule>->Void ) : Void;
	function getRules( ?ruleIdentifiers : Array<String>, f : Array<Rule>->Void ) : Void;
	function removeRules( ?ruleIdentifiers : Array<String>, f : Void->Void ) : Void;
}
