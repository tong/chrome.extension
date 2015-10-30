package chrome;

import js.html.ArrayBuffer;
import chrome.Events;

@:enum abstract ProviderError(String) from String to String {
    var OK = "OK";
    var FAILED = "FAILED";
    var IN_USE = "IN_USE";
    var EXISTS = "EXISTS";
    var NOT_FOUND = "NOT_FOUND";
    var ACCESS_DENIED = "ACCESS_DENIED";
    var TOO_MANY_OPENED = "TOO_MANY_OPENED";
    var NO_MEMORY = "NO_MEMORY";
    var NO_SPACE = "NO_SPACE";
    var NOT_A_DIRECTORY = "NOT_A_DIRECTORY";
    var INVALID_OPERATION = "INVALID_OPERATION";
    var SECURITY = "SECURITY";
    var ABORT = "ABORT";
    var NOT_A_FILE = "NOT_A_FILE";
    var NOT_EMPTY = "NOT_EMPTY";
    var INVALID_URL = "INVALID_URL";
    var IO = "IO";
}

@:enum abstract OpenFileMode(String) from String to String {
    var READ = "READ";
    var WRITE = "WRITE";
}

@:enum abstract ChangeType(String) from String to String {
    var CHANGED = "CHANGED";
    var DELETED = "DELETED";
}

@:enum abstract CommonActionId(String) from String to String {
    var SAVE_FOR_OFFLINE = "SAVE_FOR_OFFLINE";
    var OFFLINE_NOT_NECESSARY = "OFFLINE_NOT_NECESSARY";
    var SHARE = "SHARE";
}

typedef EntryMetadata = {
	var isDirectory : Bool;
	var name : String;
	var size : Float;
	var modificationTime : Date;
	@:optional var mimeType : String;
	@:optional var thumbnail : String;
}

typedef FileSystemInfo = {
	var fileSystemId : String;
	var displayName : String;
	var writable : Bool;
	var openedFilesLimit : Int;
	var openedFiles : Array<{openRequestId:Int,filePath:String,mode:OpenFileMode}>;
    @:optional var supportsNotifyTag : Bool;
    var watchers : Array<{entryPath:String,recursive:Bool,?lastTag:String}>;
}

typedef GetActionsRequestedOptions = {
	var fileSystemId : String;
	var requestId : Int;
	var entryPath : String;
}

typedef Action = {
	var id : String;
	@:optional var title : String;
}

typedef ExecuteActionRequestedOptions = {
	var fileSystemId : String;
	var requestId : Int;
	var entryPath : String;
	var actionId : String;
}


@:require(chrome_ext)
@:native("chrome.fileSystemProvider")
extern class FileSystemProvider {
    static function mount( options : {
            fileSystemId : String,
            displayName : String,
            ?writable : Bool,
            ?openedFilesLimit : Int,
            ?supportsNotifyTag : Bool
        }, ?callback : Void->Void) : Void;
    static function unmount( options : {fileSystemId:String}, ?callback : Void->Void ) : Void;
    static function getAll( options : {fileSystemId:String}, ?callback : Void->Void ) : Void;
    static function get( fileSystemId : String, callback : FileSystemInfo->Void ) : Void;
    static function notify( options : {
            fileSystemId : String,
            observedPath : String,
            recursive : Bool,
            changeType : ChangeType,
            changes : Array<{entryPath:String,changeType:ChangeType,?tag:String}>
        },
        ?callback : Void->Void ) : Void;
    static var onUnmountRequested(default,never) : Event<{fileSystemId:String,requestId:Int}->(Void->Void)->(ProviderError->Void)->Void>;
    static var onGetMetadataRequested(default,never) : Event<{fileSystemId:String,requestId:Int,entryPath:String,thumbnail:Bool}->(Void->Void)->(ProviderError->Void)->Void>;
    static var onReadDirectoryRequested(default,never) : Event<{fileSystemId:String,requestId:Int,directoryPath:String}->(Array<EntryMetadata>->Bool->Void)->(ProviderError->Void)->Void>;
    static var onOpenFileRequested(default,never) : Event<{fileSystemId:String,requestId:Int,filePath:String,mode:OpenFileMode}->(Void->Void)->(ProviderError->Void)->Void>;
    static var onCloseFileRequested(default,never) : Event<{fileSystemId:String,requestId:Int,openRequestId:Int}->(Void->Void)->(ProviderError->Void)->Void>;
    static var onReadFileRequested(default,never) : Event<{fileSystemId:String,requestId:Int,openRequestId:Int,offset:Float,length:Float}->(ArrayBuffer->Bool->Void)->(ProviderError->Void)->Void>;
    static var onCreateDirectoryRequested(default,never) : Event<{fileSystemId:String,requestId:Int,directoryPath:String,recursive:Bool}->(Void->Void)->(ProviderError->Void)->Void>;
    static var onDeleteEntryRequested(default,never) : Event<{fileSystemId:String,requestId:Int,entryPath:String,recursive:Bool}->(Void->Void)->(ProviderError->Void)->Void>;
    static var onCreateFileRequested(default,never) : Event<{fileSystemId:String,requestId:Int,filePath:String}->(Void->Void)->(ProviderError->Void)->Void>;
    static var onCopyEntryRequested(default,never) : Event<{fileSystemId:String,sourcePath:String,targetPath:String}->(Void->Void)->(ProviderError->Void)->Void>;
    static var onMoveEntryRequested(default,never) : Event<{fileSystemId:String,requestId:Int,sourcePath:String,targetPath:String}->(Void->Void)->(ProviderError->Void)->Void>;
    static var onTruncateRequested(default,never) : Event<{fileSystemId:String,requestId:Int,filePath:String,length:Float}->(Void->Void)->(ProviderError->Void)->Void>;
    static var onWriteFileRequested(default,never) : Event<{fileSystemId:String,requestId:Int,openRequestId:Int,offset:Int,data:ArrayBuffer}->(Void->Void)->(ProviderError->Void)->Void>;
    static var onAbortRequested(default,never) : Event<{fileSystemId:String,requestId:Int,operationRequestId:Int}->(Void->Void)->(ProviderError->Void)->Void>;
    static var onConfigureRequested(default,never) : Event<{fileSystemId:String,requestId:Int}->(Void->Void)->(ProviderError->Void)->Void>;
    static var onMountRequested(default,never) : Event<(Void->Void)->(ProviderError->Void)->Void>;
    static var onAddWatcherRequested(default,never) : Event<{fileSystemId:String,requestId:Int,entryPath:String,recursive:Bool}->(Void->Void)->(ProviderError->Void)->Void>;
    static var onRemoveWatcherRequested(default,never) : Event<{fileSystemId:String,requestId:Int,entryPath:String,recursive:Bool}->(Void->Void)->(ProviderError->Void)->Void>;
}
