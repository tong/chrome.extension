package chrome;

import chrome.Tabs;

@:enum abstract DesktopCaptureSourceType(String) from String to String {
	var screen = "screen";
	var window = "window";
	var tab = "tab";
	var audio = "audio";
}

@:require(chrome_ext)
@:native("chrome.desktopCapture")
extern class DesktopCapture {
	static function chooseDesktopMedia( sources : Array<DesktopCaptureSourceType>, ?targetTab : Tab, callback : String->{ canRequestAudioTrack:Bool }->Void ) : Void;
	static function cancelChooseDesktopMedia( desktopMediaRequestId : Int ) : Void;
}
