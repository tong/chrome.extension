package chrome;

typedef ProxyConfig = {
	var rules : ProxyRules; // optional
	var pacScript : PacScript; // optional
	var mode : String; //  enumerated string ["direct", "auto_detect", "pac_script", "fixed_servers", "system"]
}
