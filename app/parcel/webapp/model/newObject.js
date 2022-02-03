sap.ui.define([
	"sap/ui/model/json/JSONModel"
], function(JSONModel) {
	"use strict";
    return {	
		initModel: function() {
			return {
				awb: "",
                hawb: "",
                declaracao: "",
                declaracaoNr: "",
                ruc: "",
                transit: false,
                airTransit: false,
                origemAwb: "",
                destinoAwb: "",
                origemHawb: "",
                destinoHawb: "",
                transDoc: "",
                dtEmissaoDAT: "",
                cpfDriver: "",
                dseManual: false,
                airline: "",
                express: false,
                pesoBruto: "",
                volume: 0,
                package: "",  
                conteudo: "",
                bagDesacomp: false,
                exportador: "",
                agente: "",
                transportador: "",
                cobranca: "",
                natureza: "",
                ncm: "",
                obs: "",           
                confirm: false
			};
		}
	};
});