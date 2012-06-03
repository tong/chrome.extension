package chrome;

typedef Event<T> = {
	function addListener( a : Dynamic, ?b : Dynamic, ?c : Dynamic, ?d : Dynamic, ?e : Dynamic ) : Void;
	function removeListener( f : T ) : Void;
	function hasListener( f : T ) : Void;
}
