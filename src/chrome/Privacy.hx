package chrome;

import chrome.Types;

private typedef Services = {
	alternateErrorPagesEnabled : ChromeSetting,
	autofillEnabled : ChromeSetting,
	safeBrowsingEnabled : ChromeSetting,
	searchSuggestEnabled : ChromeSetting,
	spellingServiceEnabled : ChromeSetting,
	translationServiceEnabled : ChromeSetting
}

private typedef Websites = {
	thirdPartyCookiesAllowed : ChromeSetting,
	hyperlinkAuditingEnabled : ChromeSetting,
	referrersEnabled : ChromeSetting,
	protectedContentEnabled : ChromeSetting
}

@:require(chrome_ext)
@:native("chrome.privacy")
extern class Privacy {
	static var network(default,never) : { networkPredictionEnabled : ChromeSetting, webRTCMultipleRoutesEnabled : Dynamic };
	static var services(default,never) : Services;
	static var websites(default,never) : Websites;
}
