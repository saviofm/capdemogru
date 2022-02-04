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
          dtEmissaoDAT: null,
          cpfDriver: "",
          dseManual: false,
          airline: "",
          express: false,
          pesoBruto: null,
          volume: null,
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
          confirm: false,
          State: {
            awb: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            hawb: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            declaracao: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            declaracaoNr: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            ruc: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            transit: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            airTransit: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            origemAwb: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            destinoAwb: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            origemHawb: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            destinoHawb: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            transDoc: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            dtEmissaoDAT: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            cpfDriver: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            dseManual: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            airline: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            express: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            pesoBruto: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            volume: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            package: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            conteudo: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            bagDesacomp: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            exportador: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            agente: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            transportador: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            cobranca: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            natureza: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            ncm: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            obs: {
              Enabled: true,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            confirm: {
              Enabled: false,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            },
            buttonSave: {
              Enabled: false,
              Visible: true,
              ValueState: sap.ui.core.ValueState.None,
              ValueStateText: ""
            }
          }
        };
      }
    };
  }
);