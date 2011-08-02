package chrome.experimental.devtools;

typedef AuditCategory = {
	var onAuditStarted(default,null) : Event<AuditResults->Void>;
}
