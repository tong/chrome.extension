package chrome;

import chrome.Events;

@:enum abstract InstallStage(String) from String to String {
	var installing = "installing";
	var downloading = "downloading";
}

@:enum abstract ErrorCode(String) from String to String {
	var otherError = "otherError";
	var aborted = "aborted";
	var installInProgress = "installInProgress";
	var notPermitted = "notPermitted";
	var invalidId = "invalidId";
	var webstoreRequestError = "webstoreRequestError";
	var invalidWebstoreResponse = "invalidWebstoreResponse";
	var invalidManifest = "invalidManifest";
	var iconError = "iconError";
	var userCanceled = "userCanceled";
	var blacklisted = "blacklisted";
	var missingDependencies = "missingDependencies";
	var requirementViolations = "requirementViolations";
	var blockedByPolicy = "blockedByPolicy";
	var launchFeatureDisabled = "launchFeatureDisabled";
	var launchUnsupportedExtensionType = "launchUnsupportedExtensionType";
	var launchInProgress = "launchInProgress";
}

@:require(chrome)
@:native("chrome.webstore")
extern class Webstore {
	static function install( ?url : String, ?successCallback : Void->Void, ?failureCallback : String->?ErrorCode->Void ) : Void;
	static var onInstallStageChanged(default,null) : Event<InstallStage->Void>;
	static var onDownloadProgress(default,null) : Event<Float->Void>;
}
