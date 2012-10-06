package chrome.app;

typedef IntentResponse = {
	var intentId : Int;
	var data : Dynamic;
	var success : Bool;
}

typedef Intent = {
	var action : String;
	var type : String;
	var postResult : Void->Void; //TODO type?
	var data : Dynamic;
	var postFailure : Void->Void; //TODO type?
}

typedef LaunchData = {
	var intent : Intent;
}

@:native("chrome.app.runtime")
extern class Runtime {
	static var onLaunched(default,null) : chrome.Event<LaunchData>;
	
}
