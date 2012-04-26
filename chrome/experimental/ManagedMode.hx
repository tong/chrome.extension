package chrome.experimental;

@:native("chrome.experimental.managedMode") extern class ManagedMode {
	static function enter( ?cb : Dynamic->Void ) : Void;
	static function get( cb : Dynamic->Void ) : Void;
}
