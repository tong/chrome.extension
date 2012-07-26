package chrome.experimental;

private typedef MediaFile = Dynamic; //TODO

@:native("chrome.experimental.mediaGalleries") extern class MediaGalleries {
	static function assembleMediaFile( mediaFileContents : Dynamic, ?metadata : Dynamic, cb : MediaFile->Void ) : Void;
	static function extractEmbeddedThumbnails( ?mediaFile : Dynamic ) : Dynamic;
	static function getMediaFileSystems( cb : Array<Dynamic> ) : Void;
	static function openMediaGalleryManager() : Void;
}
