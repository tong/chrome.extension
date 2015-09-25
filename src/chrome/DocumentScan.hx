package chrome;

@:require(chrome_ext)
@:native("chrome.documentScan")
extern class DocumentScan {
    static function scan( options : { ?mimeType : Array<String>, ?maxImages : Int }, callback : { dataUrls : Array<String>, mimeType : String }->Void ) : Void;
}
