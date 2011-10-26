package chrome.experimental;

typedef TimePeriod = String;
/*
@:fakeEnum(String) enum TimePeriod {
	last_hour;
	last_day;
	last_week;
	last_month;
	everything;
}
*/

@:native("chrome.experimental.clear") extern class Clear {
	static function browsingData( period : TimePeriod, dataToRemove : Dynamic, ?cb : Void->Void ) : Void;
	static function cache( period : TimePeriod, ?cb : Void->Void ) : Void;
	static function cookies( period : TimePeriod, ?cb : Void->Void ) : Void;
	static function downloads( period : TimePeriod, ?cb : Void->Void ) : Void;
	static function formData( period : TimePeriod, ?cb : Void->Void ) : Void;
	static function history( period : TimePeriod, ?cb : Void->Void ) : Void;
	static function passwords( period : TimePeriod, ?cb : Void->Void ) : Void;
}
