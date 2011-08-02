package chrome.experimental.devtools;

@:native("chrome.experimental.devtools.panels") extern class Panels {
	static var elements : ElementsPanel;
	static function create( title : String, iconURL : String, pageURL : String, cb : ExtensionPanel->Void ) : Void;
}
