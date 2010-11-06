package chrome;

@:native("chrome.contextMenus") extern class ContextMenus {
	static function create(  createProperties : Dynamic, ?cb : Void->Void ) : Int;
	static function remove(  menuItemId : Int, ?cb : Void->Void ) : Void;
	static function removeAll( ?cb : Void->Void ) : Void;
	static function update(  id : Int, updateProperties : Dynamic, ?cb : Void->Void ) : Void;
}
