package chrome;

typedef Port = {
	var name : String;
	var sender : MessageSender;
	var onMessage : Dynamic;
	var onDisconnect : Dynamic;
	function postMessage( data : Dynamic ) : Void;
	
}
