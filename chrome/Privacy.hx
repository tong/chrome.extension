package chrome.devtools;

import chrome.type.ChromeSetting;

private typedef Services = {
	var alternateErrorPagesEnabled : ChromeSetting;
	var autofillEnabled : ChromeSetting;
	var instantEnabled : ChromeSetting;
	var safeBrowsingEnabled : ChromeSetting;
	var searchSuggestEnabled : ChromeSetting;
	var translationServiceEnabled : ChromeSetting;
}

private typedef Websites = {
	var thirdPartyCookiesAllowed : ChromeSetting;
	var autofillEnabled : ChromeSetting;
	var hyperlinkAuditingEnabled : ChromeSetting;
	var referrersEnabled : ChromeSetting;
}

@:native("chrome.devtools.privacy") extern class Privacy {
	static var network(default,null) : { networkPredictionEnabled : ChromeSetting };
	static var services(default,null) : Services;
	static var websites(default,null) : Websites;
}
