package chrome;

typedef MostVisitedURL = {
	var url : String;
	var title : String;
}

@:require(chrome)
@:require(chrome_ext)
@:native("chrome.topSites")
extern class TopSites {
	static function get( callback : Array<MostVisitedURL>->Void ) : Void;
}
