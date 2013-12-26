package chrome;

@:fakeEnum(String)
private enum Source {
	screen;
	window;
	tab;
}

@:require(chrome)
@:require(chrome_experimental)
@:native("chrome.desktopCapture")
extern class DesktopCapture {
	static function chooseDesktopMedia( sources : Array<Source>, ?origin : String, f : String->Void ) : Void;
	static function cancelChooseDesktopMedia( desktopMediaRequestId : Int ) : Void;
}
