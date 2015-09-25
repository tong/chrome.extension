package chrome;

import chrome.Events;

@:require(chrome)
@:require(chrome_ext)
@:require(chrome_dev)
@:native("chrome.location")
extern class Location {
	static function watchLocation( name : String, requestInfo : {?minDistanceInMeters:Float,?minTimeInMilliseconds:Float,?maximumAge:Float} ) : Void;
	static function clearWatch( name : String ) : Void;
	static var onLocationUpdate(default,null) : Event<{
			name : String,
			coords : {
				latitude : Float,
				longitude : Float,
				?altitude : Float,
				?accuracy : Float,
				?altitudeAccuracy : Float,
				?heading : Float,
				?speed : Float,
			},
			timestamp : Float
		}->Void>;
	static var onLocationError(default,null) : Event<String->Void>;
}
