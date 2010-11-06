
var div, event, ext;

function handleWebsiteEvent() {
	ext.postMessage( div.innerText );
}

function postMessage(d) {
	div.innerText = d;
	div.dispatchEvent( event );
}

//div = document.createElement( 'div' );
//div.id = "chrome.remoting";
//document.body.appendChild( div );

event = document.createEvent( 'Event' );
event.initEvent( 'chrome.extension.event', true, true );
div = document.getElementById("ext_com");
div.addEventListener( 'chrome.site.event', handleWebsiteEvent );
ext = chrome.extension.connect( { name : "hxchrome" } );
ext.onMessage.addListener( postMessage );
