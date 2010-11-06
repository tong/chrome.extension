package chrome;

typedef Event<T> = {
	function addListener( f : T ) : Void;
	function removeListener( f : T ) : Void;
	function hasListener( f : T ) : Void;
}
