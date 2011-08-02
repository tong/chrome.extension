package chrome.experimental.devtools;

typedef ExtensionSidebarPane = {
	function setExpression( expression : String, ?rootTitle : String ) : Void;
	function setHeight( height : String ) : Void;
	function setObject( jsonObject : String, ?rootTitle : String ) : Void;
	function setPage( url : String ) : Void;
}
