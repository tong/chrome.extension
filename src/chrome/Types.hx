package chrome;

import chrome.Events;

@:enum abstract ChromeSettingScope(String) from String to String {
	var regular = "regular";
	var regular_only = "regular_only";
	var incognito_persistent = "incognito_persistent";
	var incognito_session_only = "incognito_session_only";
}

@:enum abstract LevelOfControl(String) from String to String {
	var not_controllable = "not_controllable";
	var controlled_by_other_extensions = "controlled_by_other_extensions";
	var controllable_by_this_extension = "controllable_by_this_extension";
	var controlled_by_this_extension = "controlled_by_this_extension";
}

@:require(chrome)
@:native("chrome.types.chromeSetting")
extern class ChromeSetting {
	function get( details : {?incognito:Bool}, callback : {value:Dynamic,levelOfControl:LevelOfControl,?incognitoSpecific:Bool}->Void ) : Void;
	function set( details : {value:Dynamic,?scope:ChromeSettingScope}, ?callback : Void->Void ) : Void;
	function clear( details : {?scope:ChromeSettingScope}, ?callback : Void->Void ) : Void;
	var onChange : Event<{value:Dynamic,levelOfControl:LevelOfControl,?incognitoSpecific:Bool}->Void>;
}
