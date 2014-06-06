package chrome;

private typedef MostVisitedURL = {
	var url : String;
	var title : String;	
}

@:require(chrome_ext)
@:native("chrome.topSites")
extern class TopSites {
	static function get( f : Array<MostVisitedURL>->Void ) : Void;
}
