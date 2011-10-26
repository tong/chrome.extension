package chrome.experimental;

import chrome.type.ChromeSetting;

@:native("chrome.experimental.privacy") extern class Privacy {
	static var network : { networkPredictionEnabled : ChromeSetting };
	static var services : Dynamic;
	static var websites : Dynamic;
}

