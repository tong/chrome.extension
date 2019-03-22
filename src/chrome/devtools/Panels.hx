package chrome.devtools;

import chrome.Events;
import chrome.devtools.InspectedWindow;

typedef Window =
	#if (haxe_ver >= 3.3) js.html.Window
	#else js.html.DOMWindow #end;

typedef ElementsPanel = {
	function createSidebarPane( title : String, ?callback : ExtensionSidebarPane->Void ) : Void;
	var onSelectionChanged(default,null) : Event<Void->Void>;
}

typedef SourcesPanel = {
	function createSidebarPane( title : String, ?callback : ExtensionSidebarPane->Void ) : Void;
	var onSelectionChanged(default,null) : Event<Void->Void>;
}

typedef ExtensionPanel = {
	function createStatusBarButton( iconPath : String, tooltipText : String, disabled : Bool ) : Button;
	var onHidden(default,null) : Event<Void->Void>;
	var onSearch(default,null) : Event<String->String->Void>;
	var onShown(default,null) : Event<Window->Void>;
}

typedef ExtensionSidebarPane = {
	function setHeight( height : String ) : Button;
	function setExpression( expression : String, ?rootTitle : String, ?callback : Void->Void ) : Void;
	function setObject( jsonObject : String, ?rootTitle : String, ?callback : Void->Void ) : Void;
	function setPage( path : String ) : Void;
}

private typedef Button = {
	function update( ?iconPath : String, ?tooltipText : String, ?disabled : Bool ) : Void;
	var onClicked(default,null) : Event<Void->Void>;
}

@:require(chrome_ext)
@:native("chrome.devtools.panels")
extern class Panels {
	static var elements : ElementsPanel;
	static var sources : SourcesPanel;
	static var themeName : String;
	static function create( title : String, iconPath : String, pagePath : String, ?callback : ExtensionPanel->Void ) : Void;
	static function setOpenResourceHandler( ?f : Resource->Void ) : Void;
	static function openResource( url : String, lineNumber : Int, ?f : Void->Void ) : Void;
}
