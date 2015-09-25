package chrome;

@:enum abstract ImageFormat(String) from String to String {
    var jpeg = "jpeg";
    var png = "png";
}

typedef ImageDetails = {
    @:optional var format : ImageFormat;
    @:optional var quality : Int;
}

@:enum abstract RunAt(String) from String to String {
    var document_start = "document_start";
    var document_end = "document_end";
    var document_idle = "document_idle";
}

typedef InjectDetails = {
    @:optional var code : String;
    @:optional var file : String;
    @:optional var allFrames : Bool;
    @:optional var matchAboutBlank : Bool;
    @:optional var runAt : RunAt;
}
