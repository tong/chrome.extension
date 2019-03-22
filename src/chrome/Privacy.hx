package chrome;

import chrome.Types;

@:enum abstract IPHandlingPolicy(String) from String to String {
	var default = "default";
	var default_public_and_private_interfaces = "default_public_and_private_interfaces";
	var default_public_interface_only = "default_public_interface_only";
	var disable_non_proxied_udp = "disable_non_proxied_udp";
}

private typedef Services = {
	alternateErrorPagesEnabled : ChromeSetting,
	autofillAddressEnabled : ChromeSetting,
	autofillCreditCardEnabled : ChromeSetting,
	passwordSavingEnabled : ChromeSetting,
	safeBrowsingEnabled : ChromeSetting,
	safeBrowsingExtendedReportingEnabled : ChromeSetting,
	searchSuggestEnabled : ChromeSetting,
	spellingServiceEnabled : ChromeSetting,
	translationServiceEnabled : ChromeSetting
}

private typedef Websites = {
	thirdPartyCookiesAllowed : ChromeSetting,
	hyperlinkAuditingEnabled : ChromeSetting,
	referrersEnabled : ChromeSetting,
	doNotTrackEnabled : ChromeSetting,
	protectedContentEnabled : ChromeSetting
}

@:require(chrome_ext)
@:native("chrome.privacy")
extern class Privacy {
	static var network(default,never) : { networkPredictionEnabled : ChromeSetting, webRTCIPHandlingPolicy : Dynamic };
	static var services(default,never) : Services;
	static var websites(default,never) : Websites;
}
