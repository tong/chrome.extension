package chrome;

@:native("chrome.bookmarks") extern class Bookmarks {
	static function create( bookmark : Dynamic, ?cb : BookMarkTreeNode->Void ) : Void;	
	static function get( idOrIdList : Dynamic, cb : Array<BookMarkTreeNode>->Void ) : Void;	
	static function getChildren( id : String, cb : Array<BookMarkTreeNode>->Void ) : Void;	
	static function getRecent( numberOfItems : Int, cb : Array<BookMarkTreeNode>->Void ) : Void;
	static function getTree( cb : Array<BookMarkTreeNode>->Void ) : Void;
	static function move( id : String, destination : Dynamic, ?cb : BookMarkTreeNode->Void ) : Void;
	static function remove( id : String, ?cb : Void->Void ) : Void;
	static function search( query : String, cb : Array<BookMarkTreeNode>->Void ) : Void;
	static function update( id : String, changes : Dynamic, ?cb : Array<BookMarkTreeNode>->Void ) : Void;
	static var onChanged(default,null) : Event<String->Dynamic->Void>;
	static var onChildrenReordered(default,null) : Event<String->Dynamic->Void>;
	static var onCreated(default,null) : Event<String->BookMarkTreeNode->Void>;
	static var onImportBegan(default,null) : Event<Void->Void>;
	static var onImportEnded(default,null) : Event<Void->Void>;
	static var onMoved(default,null) : Event<String->Dynamic->Void>;
	static var onRemoved(default,null) : Event<String->Dynamic->Void>;
	
}
