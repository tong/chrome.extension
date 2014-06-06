package chrome;

typedef HistoryItem = {
	var id : String;
	@:optional var url : String;
	@:optional var title : String;
	@:optional var lastVisitTime : Float;
	@:optional var visitCount : Int;
	@:optional var typedCount : Int;
}

@:enum abstract Transition(String) {
	var link = "link";
	var typed = "typed";
	var auto_bookmark = "auto_bookmark";
	var auto_subframe = "auto_subframe";
	var manual_subframe = "manual_subframe";
	var generated = "generated";
	var start_page = "start_page";
	var form_submit = "form_submit";
	var reload = "reload";
	var keyword = "keyword";
	var keyword_generated = "keyword_generated";
}

typedef VisitItem = {
	var id : String;
	var visitId : String;
	@:optional var visitTime : Float;
	var referringVisitId : String;
	var transition : Transition;
}

@:require(chrome_ext)
@:native("chrome.history")
extern class History {
	static function search( query : { text : String, ?startTime : Float, ?endTime : Float, ?maxResults : Int }, f : Array<HistoryItem>->Void ) : Void;
	static function getVisits( details : { url : String }, f : Array<VisitItem>->Void ) : Void;
	static function addUrl( details : { url : String }, ?f : Void->Void ) : Void;
	static function deleteUrl( details : { url : String }, ?f : Void->Void )  : Void;
	static function deleteRange( range : { startTime : Float, endTime : Float }, f : Void->Void ) : Void;
	static function deleteAll( f : Void->Void ) : Void;
	static var onVisited(default,null) : Event<HistoryItem->Void>;
	static var onVisitRemoved(default,null) : Event<{allHistory:Bool,?urls:Array<String>}->Void>;
}
