package chrome.experimental.devtools;

@:native("chrome.experimental.devtools.audits") extern class Audits {
	static function addCategory( displayName : String, resultCount : Int ) : AuditCategory;
}
