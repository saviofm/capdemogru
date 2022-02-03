sap.ui.define([
	"sap/ui/model/json/JSONModel"
], function(JSONModel) {
	"use strict";
    return {	
		initModel: function() {
			return {
				awb: "",
        hawb: "",
        preParcel: "",
        declaracao: "",
        declaracaoNr: "",
        ruc: "",
        transit: false,
        express: false,
        manualCargo: false,
        dseManual: false,
        origemAwb: "",
        destinoAwb: "",
        origemHawb: "",
        destinoHawb: "",     
        airline: "",
        pesoBruto: "",
        pesoLiquido: "",
        tara: "",
        volume: 0,  
        bagDesacomp: false,
        natureza: "",
        ncm: "",
        image: "",
        barcode: "",
			};
		}
	};
});