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

typedef CertificateInfo = {
    var certificate : ArrayBuffer;
    var supportedHashes : Array<Hash>;
}

typedef SignRequest = {
    var digest : ArrayBuffer;
    var hash : Hash;
    var certificate : ArrayBuffer;
}

@:require(chrome)
@:require(chrome_os)
@:native("chrome.certificateProvider")
extern class CertificateProvider {
    static var onCertificatesRequested(default,never) : Event<(Array<CertificateInfo>->Void)->Void>;
    static var onSignDigestRequested(default,never) : Event<SignRequest->(ArrayBuffer->Void)->Void>;
}
