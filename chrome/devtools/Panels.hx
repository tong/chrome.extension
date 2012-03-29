package chrome.devtools;

private typedef ExtensionSidebarPane = {
	function setExpression( expression : String, ?rootTitle : String, ?cb : Void->Void ) : Void;
	function setHeight( height : String ) : Void;
	function setObject( jsonObject : String, ?rootTitle : String, ?cb : Void->Void ) : Void;
	function setPage( path : String ) : Void;
	var onHidden(default,null) : Event<Void->Void>;
	var onShown(default,null) : Event<js.Window->Void>;
}

private typedef ElementsPanel = {
	function createSidebarPane( title : String, ?cb : ExtensionSidebarPane->Void ) : Void;
	var onSelectionChanged(default,null) : Event<Void->Void>;
}

private typedef ExtensionPanel = {
	function createStatusBarButton( iconPath : String, tooltipText : String, disabled : Bool ) : Button;
	var onHidden(default,null) : Event<Void->Void>;
	var onSearch(default,null) : Event<String->String->Void>;
	var onShown(default,null) : Event<js.Window->Void>;
}

private typedef Button = {
	function update( ?iconPath : String, ?tooltipText : String, ?disabled : Bool ) : Void;
	var onShown(default,null) : Event<Void->Void>;
}

@:native("chrome.devtools.panels") extern class Panels {
	static var elements : ElementsPanel;
	static function create( title : String, iconPath : String, pagePath : String, ?cb : ExtensionPanel->Void ) : Void;
	static function setOpenResourceHandler( ?cb : Resource->Void ) : Void;
}
