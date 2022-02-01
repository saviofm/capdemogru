/* global QUnit */

QUnit.config.autostart = false;

sap.ui.getCore().attachInit(function() {
	"use strict";

	sap.ui.require([
		"capdemogru/app/cargoreceipt/test/integration/AllJourneys"
	], function() {
		QUnit.start();
	});
});