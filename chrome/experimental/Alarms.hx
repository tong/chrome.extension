package chrome.experimental;

typedef Alarm = {
	delayInSeconds : Int,
	?repeating : Bool
}

typedef AlarmCreateInfo = {
	delayInSeconds : Int,
	name : String,
	repeating : Bool
}

@:native("chrome.experimental.alarms") extern class Alarms {
	
	static function clear( ?name : String ) : Void;
	static function clearAll() : Void;
	static function create( ?name : String, alarmInfo : AlarmCreateInfo ) : Void;
	static function get( ?name : String, cb : Alarm->Void ) : Void;
	static function getAll( cb : Array<Alarm>->Void ) : Void;
	
	static var onAlarm : Event<Alarm->Void>;
}
