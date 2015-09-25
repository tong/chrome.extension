package chrome;

import chrome.Events;

typedef Alarm = {
	var name : String;
	var scheduledTime : Float;
	@:optional var periodInMinutes : Float;
}

typedef AlarmCreateInfo = {
	@:optional var when : Float;
	@:optional var delayInMinutes : Float;
	@:optional var periodInMinutes : Float;
}

@:require(chrome)
@:native("chrome.alarms")
extern class Alarms {
	static function create( ?name : String, alarmInfo : AlarmCreateInfo ) : Void;
	static function get( ?name : String, callback : Alarm->Void ) : Void;
	static function getAll( callback : Array<Alarm>->Void ) : Void;
	static function clear( ?name : String, ?callback : Bool->Void ) : Void;
	static function clearAll( ?callback : Bool->Void ) : Void;
	static var onAlarm(default,null) : Event<Alarm->Void>;
}
