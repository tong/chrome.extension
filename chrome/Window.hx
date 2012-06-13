package chrome;

import chrome.Windows;

typedef Window = {
	id : Int,
	focused : Bool,
	top : Int,
	left : Int,
	width : Int,
	height : Int,
	?tabs : Array<Tab>,
	incognito : Bool,
	type : String,
	state : String,
	alwaysOnTop : Bool
}
