package chrome;

import chrome.Events;

enum abstract PrintJobSource(String) to String {
	var PRINT_PREVIEW;
	var ANDROID_APP;
	var EXTENSION;
}

enum abstract PrintJobStatus(String) to String {
	var FAILED;
	var CANCELED;
	var PRINTED;
}

typedef PrintJobInfo = {
	var id : String;
	var title : String;
	var source : PrintJobSource;
	var ?sourceId : String;
	var status : PrintJobStatus;
	var creationTime : Float;
	var completionTime : Float;
	var printer : { name : String, uri : String, source : String };
	var settings : { color : String, duplex : String, mediaSize : { width : Int, height : Int, vendorId : String }, copies : Int };
	var numberOfPages : Int;
}

@:require(chrome)
@:native("chrome.printingMetrics")
extern class PrintingMetrics {
	static function getPrintJobs( callback : Array<PrintJobInfo>->Void ) : Void;
	static var onPrintJobFinished(default,never) : Event<PrintJobInfo->Void>;
}
