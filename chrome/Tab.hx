package chrome;

@:require(chrome_ext)
typedef Tab = {
	@:optional var id : Int;
	var index : Int;
	var windowId : Int;
	@:optional var openerTabId : Int;
	var selected : Bool;
	var highlighted : Bool;
	var active : Bool;
	var pinned : Bool;
	@:optional var url : String;
	@:optional var title : String;
	@:optional var favIconUrl : String;
	@:optional var status : String;
	var incognito : Bool;
	@:optional var width : Int;
	@:optional var height : Int;
	@:optional var sessionId : String;
}
