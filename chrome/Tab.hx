package chrome;

typedef Tab = {
	var id : Int;
	var index : Int;
	var windowId : Int;
	var selected : Bool;
	var url : String;
	var title : String;
	var favIconUrl : String;
	var status : String;
	var incognito : Bool;
}
