package chrome;

@:fakeEnum(String)
private enum Source {
	screen;
	window;
	tab;
}

//@:required("chrome_dev")
@:native("chrome.desktopCapture")
extern class DesktopCapture {
	static function chooseDesktopMedia( sources : Array<Source>, ?origin : String, f : String->Void ) : Void;
}
