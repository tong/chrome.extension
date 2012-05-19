package chrome.experimental;

@:fakeEnum(String) enum ScriptCode {
	Arab;
	Armn;
	Beng;
	Cans;
	Cher;
	Cyrl;
	Deva;
	Ethi;
	Geor;
	Grek;
	Gujr;
	Guru;
	Hang;
	Hans;
	Hant;
	Hebr;
	Hrkt;
	Knda;
	Khmr;
	Laoo;
	Mlym;
	Mong;
	Mymr;
	Orya;
	Sinh;
	Taml;
	Telu;
	Thaa;
	Thai;
	Tibt;
	Yiii;
}

@:fakeEnum(String) enum GenericFamily {
	standard;
	sansserif;
	serif;
	fixed;
	cursive;
	fantasy;
}

@:fakeEnum(String) enum LevelOfControl {
	not_controllable;
	controlled_by_other_extensions;
	controllable_by_this_extension;
	controlled_by_this_extension;
}

typedef FontName = {
	fontName : String,
	localizedName : String
}

/**
	http://code.google.com/chrome/extensions/dev/experimental.fontSettings.html
*/
@:native("chrome.experimental.fontSettings") extern class FontSettings {
	
	static function getDefaultCharacterSet( ?details : Dynamic, ?cb : Dynamic->Void ) : Void;
	static function getDefaultFixedFontSize( ?details : Dynamic, ?cb : Dynamic->Void ) : Void;
	static function getDefaultFontSize( ?details : Dynamic, ?cb : Dynamic->Void ) : Void;
	static function getFont( details : { ?script : ScriptCode, genericFamily : GenericFamily }, ?cb : Dynamic->Void ) : Void;
	static function getFontList( cb : Array<FontName>->Void ) : Void;
	static function getMinimumFontSize( ?details : Dynamic, ?cb : Array<FontName>->Void ) : Void;
	static function setDefaultCharacterSet( details : { charset : String }, ?cb : Void->Void ) : Void;
	static function setDefaultFixedFontSize( details : { pixelSize : Int }, ?cb : Void->Void ) : Void;
	static function setDefaultFontSize( details : { pixelSize : Int }, ?cb : Void->Void ) : Void;
	static function setFont( details : { script : ScriptCode, genericFamily : GenericFamily, fontName : String }, ?cb : Void->Void ) : Void;
	static function setMinimumFontSize( details : { pixelSize : Int }, ?cb : Void->Void ) : Void;
	
	static var onDefaultCharacterSetChanged : Event<Dynamic->Void>;
	static var onDefaultFixedFontSizeChanged : Event<Dynamic->Void>;
	static var onDefaultFontSizeChanged : Event<Dynamic->Void>;
	static var onFontChanged : Event<Dynamic->Void>;
	static var onMinimumFontSizeChanged : Event<Dynamic->Void>;
}
