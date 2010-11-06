package chrome;

/**
	An object containing information about the script context that sent a message or request.
*/
typedef MessageSender = {
	/** The extension ID of the extension that opened the connection. */
	var id : String;
	/** This property will only be present when the connection was opened from a tab or content script. */
	var tab : Tab;
}
