var exec = require('cordova/exec');

var externalUrl = {

	/**
	 * Open appUrl in app if can or browserUrl in system browser
	 * @param {string} appUrl
	 * @param {string} browserUrl
	 * @param {function} successCallback
	 * @param {function} failureCallback
	 */
	openUrl: function(appUrl, browserUrl, successCallback, failureCallback) {
		exec(
			successCallback,
			failureCallback,
			"ExternalUrl",
			"openUrl",
			[appUrl, browserUrl]
		);
	}
};

module.exports = externalUrl;