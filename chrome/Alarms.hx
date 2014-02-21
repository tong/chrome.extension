package chrome;

typedef Alarm = {
	var name : String;
	var scheduledTime : Float;
	@:optional var periodInMinutes : Float;
}

typedef AlarmCreateInfo = {
	@:optional var delayInMinutes : Float;
	@:optional var periodInMinutes : Float;
	@:optional var when : Float;
}

@:native("chrome.alarms")
extern class Alarms {
	static function create( ?name : String, alarmInfo : AlarmCreateInfo ) : Void;
	static function get( ?name : String, f : Alarm->Void ) : Void;
	static function getAll( f : Array<Alarm>->Void ) : Void;
	static function clear( ?name : String ) : Void;
	static function clearAll() : Void;
	static var onAlarm(default,null) : Event<Alarm->Void>;
}
