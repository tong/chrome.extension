package chrome;

typedef BookmarkTreeNode = {
	var id : String;
	@:optional var parentId : Null<String>;
	@:optional var index : Int;
	@:optional var url :  String;
	var title : String;
	@:optional var dateAdded : Float;
	@:optional var dateGroupModified : Float;
	@:optional var children : Array<BookmarkTreeNode>;
}

typedef BookmarkDestination = {
	@:optional var parentId : String;
	@:optional var index : Null<Int>;
}

typedef BookmarkChanges = {
	@:optional var title : String;
	@:optional var url : String;
}

typedef BookmarkChangeInfo = {
	var title : String;
	@:optional var url : Null<String>;
}

typedef Bookmark = {
	@:optional var parentId : String;
	@:optional var index : Int;
	@:optional var title : String;
	@:optional var url : String;
}

typedef BookmarkReorderInfo = {
	var childIds : Array<String>;
}

typedef BookmarkMoveInfo = {
	var parentId : String;
	var index : Int;
	var oldParentId : Int;
	var oldIndex  : Int;
}

typedef BookmarkRemoveInfo = {
	var parentId : String;
	var index : Int;
}

@:require(chrome_ext)
@:native("chrome.bookmarks")
extern class Bookmarks {

	static var MAX_WRITE_OPERATIONS_PER_HOUR(default,null) : Int;
	static var MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE(default,null) : Int;

	@:overload(function( ?idList:Array<String>, f : Array<BookmarkTreeNode>->Void ) : Void {} )
	static function get( id : String, f : Array<BookmarkTreeNode>->Void ) : Void;
	static function getChildren( id : String, f : Array<BookmarkTreeNode>->Void ) : Void;	
	static function getRecent( numberOfItems : Int, f : Array<BookmarkTreeNode>->Void ) : Void;
	static function getTree( f : Array<BookmarkTreeNode>->Void ) : Void;
	static function getSubTree( id : String, f : Array<BookmarkTreeNode>->Void ) : Void;
	static function search( query : String, f : Array<BookmarkTreeNode>->Void ) : Void;
	static function create( bookmark : Bookmark, ?f : BookmarkTreeNode->Void ) : Void;
	static function move( id : String, destination : BookmarkDestination, ?f : BookmarkTreeNode->Void ) : Void;
	static function update( id : String, changes : BookmarkChanges, ?f : Array<BookmarkTreeNode>->Void ) : Void;
	static function remove( id : String, ?f : Void->Void ) : Void;
	static function removeTree( id : String, ?f : Void->Void ) : Void;
	
	static var onCreated(default,null) : Event<String->BookmarkTreeNode->Void>;
	static var onRemoved(default,null) : Event<String->BookmarkRemoveInfo->Void>;
	static var onChanged(default,null) : Event<String->BookmarkChangeInfo->Void>;
	static var onMoved(default,null) : Event<String->BookmarkMoveInfo->Void>;
	static var onChildrenReordered(default,null) : Event<String->BookmarkReorderInfo->Void>;
	static var onImportEnded(default,null) : Event<Void->Void>;
	static var onImportBegan(default,null) : Event<Void->Void>;
}
