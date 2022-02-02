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
                transit: null,
                airTransit: null,
                origemAwb: "",
                destinoAwb: "",
                origemHawb: "",
                destinoHawb: "",
                transDoc: "",
                dtEmissaoDAT: "",
                cpfDriver: "",
                dseManual: null,
                airline: "",
                express: null,
                pesoBruto: "",
                volume: 0,
                package: "",  
                conteudo: "",
                bagDesacomp: null,
                exportador: "",
                agente: "",
                transportador: "",
                cobranca: "",
                natureza: "",
                ncm: "",
                obs: "",           
                confirm: null
			};
		}
	};
});