package chrome;

typedef Alarm = {
	@:optional var periodInMinutes : Float;
	var scheduledTime : Float;
	var name : String;
}

typedef AlarmCreateInfo = {
	@:optional var delayInMinutes : Float;
	@:optional var periodInMinutes : Float;
	@:optional var when : Float;
}

@:native("chrome.alarms")
extern class Alarms {
	static function create( ?name : String, alarmInfo : AlarmCreateInfo ) : Void;
	static function getAll( cb : Array<Alarm>->Void ) : Void;
	static function clearAll() : Void;
	static function clear( ?name : String ) : Void;
	static function get( ?name : String, cb : Alarm->Void ) : Void;
	static var onAlarm(default,null) : Event<Alarm->Void>;
}
