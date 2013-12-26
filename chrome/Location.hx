package chrome;

typedef Coords = {
	var latitude : Float;
	var longitude : Float;
	@:optional var altitude : Float;
	var accuracy : Float;
	@:optional var altitudeAccuracy : Float;
	@:optional var heading : Float;
	@:optional var speed : Float;
}

typedef LocationUpdate = {
	var name : String;
	var coords : Coords;
	var timestamp : Float;
}

@:require(chrome_ext)
@:require(chrome_experimental)
@:native("chrome.location")
extern class Location {
	static function watchLocation( name : String, requestInfo : {?minDistanceInMeters:Float,?minTimeInMilliseconds:Float,?maximumAge:Float} ) : Void;
	static function clearWatch( name : String ) : Void;
	static var onLocationUpdate(default,null) : Event<LocationUpdate->Void>;
	static var onLocationError(default,null) : Event<String->Void>;
}