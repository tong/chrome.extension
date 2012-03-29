package chrome.devtools;

typedef Resource = {
	var url(default,null) : String;
	function getContent( content : String, encoding : String ) : Void;
	function setContent( content : String, commit : Bool, ?cb : Dynamic->Void ) : Void;
}
