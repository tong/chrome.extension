package chrome.experimental.devtools;

typedef AuditResults = {
	var severity : AudiResultServerity;
	var text : String;
	var children : Array<AuditResultNode>;
	var expanded : Bool;
	function addResult( displayName : String, description : String, severity : AuditResultSeverety, ?details : AuditResultNode ) : Void;
	function createResult( ?content : Dynamic ) : AuditResultNode;
	function done() : Void;
	function snippet( text : String ) : FormattedValue;
	function url( href : String, ?displayText : String ) : FormattedValue;
	
}
