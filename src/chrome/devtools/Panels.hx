package chrome.devtools;

import js.html.DOMWindow;
import chrome.Events;
import chrome.devtools.InspectedWindow;

typedef ElementsPanel = {
	function createSidebarPane( title : String, ?callback : ExtensionSidebarPane->Void ) : Void;
	var onSelectionChanged(default,null) : Event<Void->Void>;
}

typedef ExtensionPanel = {
	function createStatusBarButton( iconPath : String, tooltipText : String, disabled : Bool ) : Button;
	var onHidden(default,null) : Event<Void->Void>;
	var onSearch(default,null) : Event<String->String->Void>;
	var onShown(default,null) : Event<DOMWindow->Void>;
}

typedef ExtensionSidebarPane = {
	function setHeight( height : String ) : Button;
	function setExpression( expression : String, ?rootTitle : String, ?callback : Void->Void ) : Void;
	function setObject( jsonObject : String, ?rootTitle : String, ?callback : Void->Void ) : Void;
	function setPage( path : String ) : Void;
}


private typedef Button = {
	function update( ?iconPath : String, ?tooltipText : String, ?disabled : Bool ) : Void;
	var onShown(default,null) : Event<Void->Void>;
}

@:require(chrome_ext)
@:native("chrome.devtools.panels")
extern class Panels {
	static var elements : ElementsPanel;
	static function create( title : String, iconPath : String, pagePath : String, ?callback : ExtensionPanel->Void ) : Void;
	static function setOpenResourceHandler( ?f : Resource->Void ) : Void;
}
