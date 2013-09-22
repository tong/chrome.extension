package chrome;

typedef MessageSender = {
	@:optional var tab : Tab;
	var id : String;
	@:optional var url : String;
}
