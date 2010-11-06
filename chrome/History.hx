package chrome;

private typedef HistoryItem = {
	var id : String;
	var url : String;
	var title : String;
	var lastVisitTime : String;
	var visitCount : Int;
	var typedCount : Int;
}

private typedef VisitItem = {
	var id : String;
	var visitId : String;
	var visitTime : Float;
	var referringVisitId : String;
	var transition : String;
}

@:native("chrome.history") extern class History {
	static function addUrl( details : Dynamic ) : Void;
	static function deleteAll( cb : Void->Void ) : Void;
	static function deleteRange( cb : Void->Void ) : Void;
	static function deleteUrl( details : Dynamic )  : Void;
	static function getVisits( details : Dynamic, cb : Array<VisitItem>->Void ) : Void;
	static function search( details : Dynamic, cb : Array<VisitItem>->Void ) : Void;
	static var onVisitRemoved(default,null) : Event<Dynamic->Void>;
	static var onVisited(default,null) : Event<HistoryItem->Void>;
}
