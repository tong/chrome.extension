package chrome;

typedef Window = {
	var id : Int;
	var focused : Bool;
	var top : Int;
	var left : Int;
	var width : Int;
	var height : Int;
	var tabs : Array<Tab>;
	var incognito : Bool;
	var type : String;
}
