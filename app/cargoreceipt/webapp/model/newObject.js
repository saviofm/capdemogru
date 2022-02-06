sap.ui.define([
	"sap/ui/model/json/JSONModel"
], function(JSONModel) {
	"use strict";
    return {	
		initModel: function() {
			return {
				awb: "",
        hawb: "",
        ruc: "",
        uld: "",
        preParcel: "",
        declaracao: "",
        declaracaoNr: "",
        position: "",
        transit: false,
        express: false,
        manualCargo: false,
        dseManual: false,
        origemAwb: "",
        destinoAwb: "",
        origemHawb: "",
        destinoHawb: "",     
        airline: "",
        pesoBruto: null,
        pesoLiquido: null,
        tara: null,
        volume: 0,  
        bagDesacomp: false,
        natureza: "",
        ncm: "",
        image: "",
        barcode: "",
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
          uld: {
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
          position: {
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
          express: {
            Enabled: true,
            Visible: true,
            ValueState: sap.ui.core.ValueState.None,
            ValueStateText: ""
          },
          manualCargo: {
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
          airline: {
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
          pesoLiquido: {
            Enabled: true,
            Visible: true,
            ValueState: sap.ui.core.ValueState.None,
            ValueStateText: ""
          },
          tara: {
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
          bagDesacomp: {
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
          image: {
            Enabled: true,
            Visible: true,
            ValueState: sap.ui.core.ValueState.None,
            ValueStateText: ""
          },
          barcode: {
            Enabled: true,
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