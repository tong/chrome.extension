package chrome;

typedef ResourceIdentifier = {
	var id : String;
	@:optional var description : String;
}

@:enum abstract Scope(String) from String to String{
	var regular = "regular";
	var incognito_session_only = "incognito_session_only";
}

@:enum abstract CookiesContentSetting(String) from String to String{
	var allow = "allow";
	var block = "block";
	var session_only = "session_only";
}

@:enum abstract ImagesContentSetting(String) from String to String{
	var allow = "allow";
	var block = "block";
}

@:enum abstract JavascriptContentSetting(String) from String to String{
	var allow = "allow";
	var block = "block";
}

@:enum abstract LocationContentSetting(String) from String to String{
	var allow = "allow";
	var block = "block";
	var ask = "ask";
}

@:enum abstract PluginsContentSetting(String) from String to String{
	var allow = "allow";
	var block = "block";
	var detect_important_content = "detect_important_content";
}

@:enum abstract PopupsContentSetting(String) from String to String{
	var allow = "allow";
	var block = "block";
}

@:enum abstract NotificationsContentSetting(String) from String to String{
	var allow = "allow";
	var block = "block";
	var ask = "ask";
}

@:enum abstract MicrophoneContentSetting(String) from String to String{
	var allow = "allow";
	var block = "block";
	var ask = "ask";
}

@:enum abstract CameraContentSetting(String) from String to String{
	var allow = "allow";
	var block = "block";
	var ask = "ask";
}

@:enum abstract PpapiBrokerContentSetting(String) from String to String{
	var allow = "allow";
	var block = "block";
	var ask = "ask";
}

@:enum abstract MultipleAutomaticDownloadsContentSetting(String) from String to String{
	var allow = "allow";
	var block = "block";
	var ask = "ask";
}

@:require(chrome_ext)
@:native("chrome.contentSetting")
extern class ContentSetting {

	static var cookies(default,never) : CookiesContentSetting;
	static var images(default,never) : ImagesContentSetting;
	static var javascript(default,never) : JavascriptContentSetting;
	static var location(default,never) : LocationContentSetting;
	static var plugins(default,never) : PluginsContentSetting;
	static var popups(default,never) : PopupsContentSetting;
	static var notifications(default,never) : NotificationsContentSetting;
	static var microphone(default,never) : MicrophoneContentSetting;
	static var camera(default,never) : CameraContentSetting;
	static var unsandboxedPlugins(default,never) : PpapiBrokerContentSetting;
	static var automaticDownloads(default,never) : MultipleAutomaticDownloadsContentSetting;

	static function clear( details : { ?scope : Scope }, ?callback : Void->Void ) : Void;
	static function get( details : { primaryUrl : String, secondaryUrl : String, ?resourceIdentifier : ResourceIdentifier, ?incognito : Bool }, callback : Dynamic->Void ) : Void;
	static function set( details : { primaryPattern : String, secondaryPattern : String, ?resourceIdentifier : ResourceIdentifier, setting : Dynamic, ?scope : Scope }, callback : Dynamic->Void ) : Void;
	static function getResourceIdentifiers( callback : Array<ResourceIdentifier>->Void ) : Void;
}
