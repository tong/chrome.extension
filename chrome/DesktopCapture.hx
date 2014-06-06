package chrome;

@:enum abstract DesktopCaptureSourceType(String) {
	var screen = "screen";
	var window = "window";
	var tab = "tab";
} 

@:require(chrome_ext)
@:native("chrome.desktopCapture")
extern class DesktopCapture {
	static function chooseDesktopMedia( sources : Array<DesktopCaptureSourceType>, ?targetTab : Tab, f : String->Void ) : Void;
	static function cancelChooseDesktopMedia( desktopMediaRequestId : Int ) : Void;
}
