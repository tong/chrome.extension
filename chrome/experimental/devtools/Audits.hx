package chrome.experimental.devtools;

typedef FormattedValue = Dynamic;
typedef AuditResultNode = Dynamic;

@:fakeEnum(String)
enum AuditResultSeverity{
	Info;
	Warning;
	Severe;
}

typedef AuditResults = {
	var severity : Severity;
	var text : String;
	@:optional var children : Array<AuditResultNode>;
	@:optional var expanded : Bool;
	function addResult( displayName : String, description : String, severity  : AuditResultSeverity, ?details : AuditResultNode  ) : AuditResults;
	function createResult( content : FormattedValue ) : AuditResultNode; 
	function done() : AuditResults; 
	function createURL( href : String, ?displayText : String ) : FormattedValue; 
	function createSnippet( text : String ) : FormattedValue; 
}

typedef AuditCategory = {
	var onAuditStarted : chrome.Event<AuditResults>;
}

@:native("chrome.experimental.devtools.audits")
extern class Audits {
	static function addCategory( displayName : String, resultCount : Float ) : AuditCategory;
}
