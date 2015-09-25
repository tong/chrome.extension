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
    static var onGetPrintersRequested(default,null) : Event<(Array<PrinterInfo>->Void)->Void>;
    //TODO static var onGetUsbPrinterInfoRequested(default,null) : Event<(chrome.usb.Device->PrinterInfo->Void)->Void>;
    static var onGetUsbPrinterInfoRequested(default,null) : Event<(Dynamic->PrinterInfo->Void)->Void>;
    static var onGetCapabilityRequested(default,null) : Event<Dynamic->Void>;
    static var onPrintRequested(default,null) : Event<{printerId:String,title:String,ticket:Dynamic,contentType:String,document:js.html.Blob}->(String->Void)->Void>;
}
