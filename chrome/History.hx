package chrome;

typedef HistoryItem = {
	var id : String;
	var url : Null<String>;
	var title : Null<String>;
	var lastVisitTime : Null<Float>;
	var visitCount : Null<Int>;
	var typedCount : Null<Int>;
}

@:fakeEnum(String) enum Transition {
	link;
	typed;
	auto_bookmark;
	auto_subframe;
	manual_subframe;
	generated;
	start_page;
	form_submit;
	reload;
	keyword;
	keyword_generated;
}

typedef VisitItem = {
	var id : String;
	var visitId : String;
	var visitTime : Null<Float>;
	var referringVisitId : String;
	var transition : Transition;
}

@:native("chrome.history") extern class History {
	
	static function addUrl( details : { url : String } ) : Void;
	static function deleteAll( cb : Void->Void ) : Void;
	static function deleteRange( range : { startTime : Float, endTime : Float }, cb : Void->Void ) : Void;
	static function deleteUrl( details : { url : String } )  : Void;
	static function getVisits( details : { url : String }, cb : Array<VisitItem>->Void ) : Void;
	static function search(
		details : {
			text : String,
			?startTime : Float,
			?endTime : Float,
			?maxResults : Int
		},
		cb : Array<HistoryItem>->Void
	) : Void;
	
	static var onVisitRemoved(default,null) : Event<Dynamic->Void>;
	static var onVisited(default,null) : Event<HistoryItem->Void>;
	
}
