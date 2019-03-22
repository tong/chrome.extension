package chrome;

import js.html.ArrayBuffer;
import chrome.Events;

@:enum abstract Hash(String) from String to String{
	var MD5_SHA1 = "MD5_SHA1";
	var SHA1 = "SHA1";
	var SHA256 = "SHA256";
	var SHA384 = "SHA384";
	var SHA512 = "SHA512";
}

@:enum abstract PinRequestErrorType(String) from String to String{
	var INVALID_PIN = "INVALID_PIN";
	var INVALID_PUK = "INVALID_PUK";
	var MAX_ATTEMPTS_EXCEEDED = "MAX_ATTEMPTS_EXCEEDED";
	var UNKNOWN_ERROR = "UNKNOWN_ERROR";
}

@:enum abstract RequestType(String) from String to String{
	var PIN = "PIN";
	var PUK = "PUK";
}

typedef CertificateInfo = {
    var certificate : ArrayBuffer;
    var supportedHashes : Array<Hash>;
}

typedef SignRequest = {
    var signRequestId : Int;
    var digest : ArrayBuffer;
    var hash : Hash;
    var certificate : ArrayBuffer;
}

@:require(chrome)
@:require(chrome_os)
@:native("chrome.certificateProvider")
extern class CertificateProvider {
    static function requestPin(details : {
        signRequestId : Int,
        ?requestType : RequestType,
        ?errorType : PinRequestErrorType,
        ?attemptsLeft : Int
    },callback : { userInput:String }->Void) : Void;
    static function stopPinRequest(details : {
        signRequestId : Int,
        ?errorType : PinRequestErrorType,
    },callback : Void->Void) : Void;
    static var onCertificatesRequested(default,never) : Event<(Array<CertificateInfo>->Void)->Void>;
    static var onSignDigestRequested(default,never) : Event<SignRequest->(ArrayBuffer->Void)->Void>;
}
