package chrome.experimental.devtools;

@:native("chrome.experimental.devtools.panels") extern class Panels {
	static var elements : Dynamic;//ElementsPanel;
	static function create( title : String, iconURL : String, pageURL : String, cb : Dynamic/*ExtensionPanel*/->Void ) : Void;
}
