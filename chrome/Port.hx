package chrome;

typedef Port = {
	var name : String;
	var sender : MessageSender;
	var onMessage : Dynamic; //Event; //TODO
	var onDisconnect : Dynamic; // Event<Void->Void>; //TODO 
	function postMessage( data : Dynamic ) : Void;
}
