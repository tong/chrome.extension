package chrome;

typedef Alarm = {
	?periodInMinutes : Float,
	scheduledTime : Float,
	name : String
}

typedef AlarmCreateInfo = {
	?delayInMinutes : Float,
	?periodInMinutes : Float,
	?when : Float
}

@:native("chrome.alarms") extern class Alarms {

	static function create( ?name : String, alarmInfo : AlarmCreateInfo ) : Void;
	static function getAll( cb : Array<Alarm>->Void ) : Void;
	static function clearAll() : Void;
	static function clear( ?name : String ) : Void;
	static function get( ?name : String, cb : Alarm->Void ) : Void;
	
	static var onAlarm : Event<Alarm->Void>;
}
