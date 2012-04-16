package chrome;

import chrome.types.ChromeSetting;

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

/**
 * http://code.google.com/chrome/extensions/privacy.html
 */
@:native("chrome.privacy") extern class Privacy {
	static var network(default,never) : { networkPredictionEnabled : ChromeSetting };
	static var services(default,never) : Services;
	static var websites(default,never) : Websites;
}
