package chrome.experimental;

import chrome.type.ChromeSetting;

@:native("chrome.experimental.privacy") extern class Privacy {
	
	static var network : {
		networkPredictionEnabled : ChromeSetting
	};
	
	static var services : {
		alternateErrorPagesEnabled : ChromeSetting,
		autofillEnabled : ChromeSetting,
		instantEnabled : ChromeSetting,
		metricsReportingEnabled : ChromeSetting,
		safeBrowsingEnabled : ChromeSetting,
		searchSuggestEnabled : ChromeSetting,
		translationServiceEnabled : ChromeSetting
	};
	
	static var websites : {
		thirdPartyCookiesAllowed : ChromeSetting,
		hyperlinkAuditingEnabled : ChromeSetting,
		referrersEnabled : ChromeSetting
	};
	
}

