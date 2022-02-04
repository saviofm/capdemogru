sap.ui.define([
    "./BaseController",
    "sap/ui/model/json/JSONModel",
    "sap/ui/core/routing/History",
    "../model/newObject",
    "sap/m/ColumnListItem",
	"sap/m/Label",
	"sap/m/Token",
	"sap/ui/core/Fragment",
    "sap/ui/core/Core",
	"sap/ui/core/library",
	"../model/formatter",
    "sap/m/MessageToast",
    "sap/m/MessageBox",
], function (BaseController,
	JSONModel,
	History,
	NewObject,
	ColumnListItem,
	Label,
	Token,
	Fragment,
	Core,
	library,
	Formatter,
    MessageToast,
    MessageBox) {
    "use strict";
    var ValueState = library.ValueState;
    return BaseController.extend("capdemogru.app.parcel.controller.NewObject", {

        formatter: Formatter,

        /* =========================================================== */
        /* lifecycle methods                                           */
        /* =========================================================== */

        /**
         * Called when the worklist controller is instantiated.
         * @public
         */
        onInit : function () {
            // Model used to manipulate control states. The chosen values make sure,
            // detail page shows busy indication immediately so there is no break in
            // between the busy indication for loading the view's meta data
            var oViewModel = new JSONModel({
                    busy : true,
                    delay : 0
                });
            this.getRouter().getRoute("newObject").attachPatternMatched(this._onObjectMatched, this);
            this.setModel(oViewModel, "newObjectView");
        },
        /* =========================================================== */
        /* event handlers                                              */
        /* =========================================================== */


        /**
         * Event handler  for navigating back.
         * It there is a history entry we go one step back in the browser history
         * If not, it will replace the current entry of the browser history with the worklist route.
         * @public
         */
        onNavBack : function() {
            var sPreviousHash = History.getInstance().getPreviousHash();
            if (sPreviousHash !== undefined) {
                // eslint-disable-next-line sap-no-history-manipulation
                history.go(-1);
            } else {
                this.getRouter().navTo("worklist", {}, true);
            }
        },

        handleDateChange: function (oEvent) {
			let oDP    = oEvent.getSource(),	
				bValid = oEvent.getParameter("valid");
	
			if (bValid) {
				oDP.setValueState(ValueState.None);
			} else {
				oDP.setValueState(ValueState.Error);
			}
		},

        onValidationFields: function(oEvent){
            let aFieldClass = ["awb", "ruc", "cpfDriver", "confirm", "dtEmissaoDAT"],
                oModel      = this.getModel("newObjectView").getData(),
                bValid      = true;

            aFieldClass.forEach(sField =>{
                if(oModel[sField] === "" || oModel[sField] === false || oModel[sField] === null){
                    oModel.State[sField].ValueState     = sap.ui.core.ValueState.Error;
                    oModel.State[sField].ValueStateText = this.getResourceBundle().getText("validationRequiredField");
                    bValid = false;
                }else {
                    oModel.State[sField].ValueState     = sap.ui.core.ValueState.None;
                    oModel.State[sField].ValueStateText = "";
                }
            });

            if(!bValid){
                oModel.State.buttonSave.Enabled = false;
            }else{
                oModel.State.buttonSave.Enabled = true;
            }

            this.getModel("newObjectView").refresh(true);
        },

        onPresSave: function(oEvent){
            this.setAppBusy(true);

            let oModel           = this.getModel("newObjectView").getData(),
                oObjectPreParcel = this._createObjectPreParcel(oModel);
            
            this.getModel().create("/Parcel", oObjectPreParcel, {
                success: function(oData){
                    this.getRouter().navTo("worklist");

                    this.getModel().refresh(true);
                    
                    MessageToast.show(this.getResourceBundle().getText("messageSuccessCreatePreParcel"));

                    this.setAppBusy(false);
                }.bind(this),
                error: function(oError){
                    MessageBox.error(this.getResourceBundle().getText("messageErrorCreatePreParcel"));

                    this.setAppBusy(false);
                }.bind(this)
            });
        },

        /* =========================================================== */
        /* internal methods                                            */
        /* =========================================================== */

        /**
         * Binds the view to the object path.
         * @function
         * @param {sap.ui.base.Event} oEvent pattern match event in route 'object'
         * @private
         */
        _onObjectMatched : function (oEvent) {
            this.getModel("newObjectView").setData(NewObject.initModel());
            this.getModel("newObjectView").refresh(true);
            //this.getView().byId("saveButton").setEnabled(false);  
        },

        _createObjectPreParcel: function(sModel){
            let Model = {
                awb: this._clearFormatting(sModel.awb),
                hawb: this._clearFormatting(sModel.hawb),     
                ruc: this._clearFormatting(sModel.ruc),
                declaracaoNr: sModel.declaracaoNr,
                transit: sModel.transit,
                airTransit: sModel.airTransit,       
                transDoc: sModel.transDoc,
                dtEmissaoDAT: Formatter.dateFormat(sModel.dtEmissaoDAT),
                cpfDriver: this._clearFormatting(sModel.cpfDriver),
                dseManual: sModel.dseManual,
                express: sModel.express,
                volume: sModel.volume,   
                conteudo: sModel.conteudo,   
                bagDesacomp: sModel.bagDesacomp,
                ncm: this._clearFormatting(sModel.ncm),
                obs: sModel.obs,
                confirm: sModel.confirm
            
            }

            if (sModel.pesoBruto)       Model.pesoBruto     = this._clearFormatting(Formatter.numberUnit(sModel.pesoBruto));
            if (sModel.declaracao)      Model.declaracao    = { declaracao: sModel.declaracao };
            if (sModel.origemAwb)       Model.origemAwb     = { ID: sModel.origemAwb };
            if (sModel.destinoAwb)      Model.destinoAwb    = { ID: sModel.destinoAwb };
            if (sModel.origemHawb)      Model.origemHawb    = { ID: sModel.origemHawb };
            if (sModel.destinoHawb)     Model.destinoHawb   = { ID: sModel.destinoHawb };
            if (sModel.airline)         Model.airline       = { ID: sModel.airline };
            if (sModel.package)         Model.package       = { ID: sModel.package };
            if (sModel.exportador)      Model.exportador    = { ID: sModel.exportador };
            if (sModel.agente)          Model.agente        = { ID: sModel.agente };
            if (sModel.transportador)   Model.transportador = { ID: sModel.transportador };
            if (sModel.cobranca)        Model.cobranca      = { partnerTypeCode: sModel.cobranca };



            let aNatureza = [];
            for (let i = 0; i < sModel.natureza.length; i++) {
                if (sModel.natureza[i] != "") aNatureza.push({ natureza: { ID: sModel.natureza[i] }}); 
            }

            if (sModel.natureza.length != 0) Model.natureza = aNatureza;
            


            return Model; 

        },

        _clearFormatting: function(sValue){
            return sValue.replaceAll(".", "")
                         .replace(",", "")
                         .replace("-", "");
        }
    });

});
