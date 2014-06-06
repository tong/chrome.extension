package chrome;

import chrome.types.ChromeSetting;

private typedef Services = {
	var alternateErrorPagesEnabled : ChromeSetting;
	var autofillEnabled : ChromeSetting;
	var safeBrowsingEnabled : ChromeSetting;
	var searchSuggestEnabled : ChromeSetting;
	var spellingServiceEnabled : ChromeSetting;
	var translationServiceEnabled : ChromeSetting;
}

private typedef Websites = {
	var thirdPartyCookiesAllowed : ChromeSetting;
	var hyperlinkAuditingEnabled : ChromeSetting;
	var referrersEnabled : ChromeSetting;
	var protectedContentEnabled : ChromeSetting;
}

@:require(chrome_ext)
@:native("chrome.privacy")
extern class Privacy {
	static var network(default,never) : { networkPredictionEnabled : ChromeSetting };
	static var services(default,never) : Services;
	static var websites(default,never) : Websites;
}
