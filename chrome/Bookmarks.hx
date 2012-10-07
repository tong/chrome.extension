package chrome;

typedef BookmarkTreeNode = {
	var id : String;
	var parentId : Null<String>;
	var index : Null<Int>;
	var url :  Null<String>;
	var title : String;
	var dateAdded :  Null<Float>;
	var dateGroupModified :  Null<Float>;
	var children : Null<Array<BookmarkTreeNode>>;
}

typedef BookmarkDestination = {
	var parentId : String;
	var index : Null<Int>;
}

private typedef BookmarkChanges = {
	var title : Null<String>;
	var url : Null<String>;
}

private typedef BookmarkChangeInfo = {
	var title : String;
	var url : Null<String>;
}

typedef Bookmark = { >BookmarkDestination,
	var title : Null<String>;
	var url : Null<String>;
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

/**
	http://code.google.com/chrome/extensions/bookmarks.html
 */
@:native("chrome.bookmarks") extern class Bookmarks {

	static function create( bookmark : Bookmark, ?cb : BookmarkTreeNode->Void ) : Void;	
	@:overload(function( ?idList:Array<String>, cb:Array<BookmarkTreeNode>->Void ) : Void {} )
	static function get( id : String, cb : Array<BookmarkTreeNode>->Void ) : Void;	
	static function getChildren( id : String, cb : Array<BookmarkTreeNode>->Void ) : Void;	
	static function getRecent( numberOfItems : Int, cb : Array<BookmarkTreeNode>->Void ) : Void;
	static function getTree( cb : Array<BookmarkTreeNode>->Void ) : Void;
	static function getSubTree( id : String, cb : Array<BookmarkTreeNode>->Void ) : Void;
	static function move( id : String, destination : BookmarkDestination, ?cb : BookmarkTreeNode->Void ) : Void;
	static function remove( id : String, ?cb : Void->Void ) : Void;
	static function search( query : String, cb : Array<BookmarkTreeNode>->Void ) : Void;
	static function update( id : String, changes : BookmarkChanges, ?cb : Array<BookmarkTreeNode>->Void ) : Void;
	
	static var onChanged(default,null) : Event<String->BookmarkChangeInfo->Void>;
	static var onChildrenReordered(default,null) : Event<String->BookmarkReorderInfo->Void>;
	static var onCreated(default,null) : Event<String->BookmarkTreeNode->Void>;
	static var onImportBegan(default,null) : Event<Void->Void>;
	static var onImportEnded(default,null) : Event<Void->Void>;
	static var onMoved(default,null) : Event<String->BookmarkMoveInfo->Void>;
	static var onRemoved(default,null) : Event<String->Dynamic->Void>;
}
