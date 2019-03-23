package chrome;

@:enum abstract WallpaperLayout(String) from String to String {
    var STRETCH = "STRETCH";
    var CENTER = "CENTER";
    var CENTER_CROPPED = "CENTER_CROPPED";
}

@:require(chrome_os)
@:native("chrome.wallpaper")
extern class Wallpaper {
    static function setWallpaper( details : {
            ?data:Dynamic,
            ?url:String,
            layout:WallpaperLayout,
            filename:String,
            ?thumbnail:Bool
        },
        callback : Dynamic->Void
    ) : Void;
}
