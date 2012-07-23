package chrome.experimental;

typedef Device = {
	var handle : Int;
	var productId : Int;
	var vendorId : Int;
}

typedef GenericTransferInfo = {
	?data : ArrayBuffer,
	direction : String,
	endpoint : Int,
	?length : Int
}

typedef ControlTransferInfo = {
	?data : ArrayBuffer,
	direction : String,
	index : Int,
	?length : Int,
	recipient : String,
	request : Int,
	requestType : String,
	value : Int
}

typedef DeviceOptions = {
	?onEvent : UsbEvent->Void
}

typedef UsbEvent = {
	?data : ArrayBuffer,
	?error : String,
	?resultCode : Int,
	type : String
}

typedef IsochronousTransferInfo = {
	packetLength : Int,
	packets : Int,
	transferInfo : GenericTransferInfo
}

@:native("chrome.experimental.usb") extern class USB {

	static function bulkTransfer( bulkTransfer : Device, transferInfo : GenericTransferInfo, ?cb : Void->Void ) : Void;
	static function closeDevice( device : Device ) : Void;
	static function controlTransfer( device : Device, transferInfo : ControlTransferInfo, ?cb : Void->Void ) : Void;
	static function findDevice( vendorId : Int, productId : Int, options : DeviceOptions, ?cb : Device->Void ) : Void;
	static function interruptTransfer( device : Device, transferInfo : GenericTransferInfo, ?cb : Void->Void ) : Void;
	static function isochronousTransfer( device : Device, transferInfo : IsochronousTransferInfo, ?cb : Void->Void ) : Void;
	
	static var onEvent(default,null) : Event<UsbEvent->Void>;
}
