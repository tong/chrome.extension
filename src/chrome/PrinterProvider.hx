package chrome;

import chrome.Events;

typedef PrinterInfo = {
    var id : String;
    var name : String;
    @:optional var description : String;
}

@:require(chrome)
@:native("chrome.printerProvider")
extern class PrinterProvider {
    static var onGetPrintersRequested(default,never) : Event<(Array<PrinterInfo>->Void)->Void>;
    //TODO static var onGetUsbPrinterInfoRequested(default,never) : Event<(chrome.usb.Device->PrinterInfo->Void)->Void>;
    static var onGetUsbPrinterInfoRequested(default,never) : Event<Dynamic->(PrinterInfo->Void)->Void>;
    static var onGetCapabilityRequested(default,never) : Event<String->(Dynamic->Void)->Void>;
    static var onPrintRequested(default,never) : Event<{printerId:String,title:String,ticket:Dynamic,contentType:String,document:js.html.Blob}->(String->Void)->Void>;
}
