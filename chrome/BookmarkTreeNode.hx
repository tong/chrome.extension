package chrome;

typedef BookmarkTreeNode = {
	var id : String;
	var parentId : String;
	var index : Int;
	var url : String;
	var title : String;
	var dateAdded : Float;
	var dateGroupModified : Float;
	var children : Array<BookmarkTreeNode>;
}
