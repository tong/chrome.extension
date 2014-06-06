package chrome;
	
@:enum abstract InstallStage(String) {
	var installing = "installing";
	var downloading = "downloading";
}

@:require(chrome)
@:native("chrome.webstore")
extern class Webstore {
	static function install( ?url : String, ?successCallback : Void->Void, ?failureCallback : String->Void ) : Void;
	static var onInstallStageChanged(default,null) : Event<InstallStage->Void>;
	static var onDownloadProgress(default,null) : Event<Float->Void>;
}
