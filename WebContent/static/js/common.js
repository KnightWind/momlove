function errorDialog(message) {
		$("<div/>").errorDialog({
			"title": "error",
			"dialogClass" : "ui-dialog-smile",
			"message" : message,
			"actions": ["关闭"]
		});
	}
	
	function successDialog(message) {
		$("<div/>").successDialog({
			"title": "提示",
			"dialogClass" : "ui-dialog-smile",
			"message" : message,
			"actions": ["关闭"]
		});
	}
	function confirmDialog(message, callback) {
		$("<div/>").confirmDialog({
			"title": "提示",
			"dialogClass" : "ui-dialog-smile",
			"message" : message,
			"actions": ["确定", "取消"],
			"callback" : callback
		});
	}