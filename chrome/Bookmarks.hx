package chrome;

typedef BookmarkTreeNode = {
	var id : String;
	var parentId : String; // optional
	var index : Int; // optional
	var url : String;  // optional
	var title : String;
	var dateAdded : Float;  // optional
	var dateGroupModified : Float;  // optional
	var children : Array<BookmarkTreeNode>;  // optional
}

typedef BookmarkDestination = {
	var parentId : String;
	var index : Int; // optional
}

private typedef BookmarkChanges = {
	var title : String; // optional
	var url : String; // optional
}

typedef Bookmark = { >BookmarkDestination,
	//>BookmarkChanges // extending 2 typedefs does not work (#) :-(
	//var parentId : String;
	//var index : Int; // optional
	var title : String; // optional
	var url : String; // optional
}

private typedef BookmarkReorderInfo = {
	var childIds : Array<String>;
}

private typedef BookmarkMoveInfo = {
	var parentId : String;
	var index : Int;
	var oldParentId : Int;
	var oldIndex  : Int;
}

private typedef BookmarkRemoveInfo = {
	var parentId : String;
	var index : Int;
}

@:native("chrome.bookmarks") extern class Bookmarks {
	static function create( bookmark : Bookmark, ?cb : BookmarkTreeNode->Void ) : Void;	
	@:overload(function get(?idList:Array<String>,cb:Array<BookmarkTreeNode>->Void):Void{})
	static function get( id : String, cb : Array<BookmarkTreeNode>->Void ) : Void;	
	static function getChildren( id : String, cb : Array<BookmarkTreeNode>->Void ) : Void;	
	static function getRecent( numberOfItems : Int, cb : Array<BookmarkTreeNode>->Void ) : Void;
	static function getTree( cb : Array<BookmarkTreeNode>->Void ) : Void;
	static function getSubTree( id : String, cb : Array<BookmarkTreeNode>->Void ) : Void;
	static function move( id : String, destination : BookmarkDestination, ?cb : BookmarkTreeNode->Void ) : Void;
	static function remove( id : String, ?cb : Void->Void ) : Void;
	static function search( query : String, cb : Array<BookmarkTreeNode>->Void ) : Void;
	static function update( id : String, changes : BookmarkChanges, ?cb : Array<BookmarkTreeNode>->Void ) : Void;
	static var onChanged(default,null) : Event<String->BookmarkChanges->Void>;
	static var onChildrenReordered(default,null) : Event<String->BookmarkReorderInfo->Void>;
	static var onCreated(default,null) : Event<String->BookmarkTreeNode->Void>;
	static var onImportBegan(default,null) : Event<Void->Void>;
	static var onImportEnded(default,null) : Event<Void->Void>;
	static var onMoved(default,null) : Event<String->BookmarkMoveInfo->Void>;
	static var onRemoved(default,null) : Event<String->Dynamic->Void>;
}
