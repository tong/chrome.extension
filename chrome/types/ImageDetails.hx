package chrome.types;

@:enum abstract ImageFormat(String) {
	var jpeg = "jpeg";
	var png = "png";
}

typedef ImageDetails = {
	@:optional var format : ImageFormat;
	@:optional var quality : Int;
}
