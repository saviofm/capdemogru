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
    return BaseController.extend("capdemogru.app.cargoreceipt.controller.NewObject", {

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
         * It there is a history entry wime go one step back in the browser history
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
        onValidationFields: function(oEvent){
            let aFieldClass = ["awb", "ruc", "uld", "pesoBruto", "pesoLiquido", "volume"],
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

        onChangeCamera : function(oEvent){
            //oFileUploader = oEvent.getSource();

            var afile = oEvent.getParameters().files[0];


            var reader = new FileReader();

            reader.onerror = function (e) {
                //MessageToast.show(oResourceBundle.getText("uploadError"), { duration:1000 });
                console.log(e);
            }.bind(this);

            reader.onloadend = function() {
                this.getModel("newObjectView").setProperty("/image", reader.result); 
            }.bind(this);

            reader.readAsDataURL(afile);
            //oFileUploader.upload();


            /*
            var vTicket = path
            var aFiles=oEvt.getParameters().files;
            var currentFile = aFiles[0];
            oView.getController().resizeAndUpload(currentFile,{
                    success:function(oEvt){
                        oFileUploader.setValue("");
                        //Here the image is on the backend, so i call it again and set the image
                    },
                    error:function(oEvt){
                       ..........
                    }
                });
                */

        },

            //onUploadCompleted(oEvent){
            //    console.log(oEvent);
            //},
            
        onScanSuccess: function(oEvent) {
            var oResourceBundle = this.getResourceBundle();
            if (oEvent.getParameter("cancelled")) {
                MessageToast.show(oResourceBundle.getText("scanCancelled"), { duration:1000 });
            } else {
                if (oEvent.getParameter("text")) {         
                    this.getModel("newObjectView").setProperty("/barcode", oEvent.getParameter("text"));

                  
                } else {
                    this.getModel("newObjectView").setProperty("/barcode", "");
                  
                    
                }
            }
        },

        onScanError: function(oEvent) {
            var oResourceBundle = this.getResourceBundle();
            MessageToast.show(oResourceBundle.getText("scanFailed") + oEvent, { duration:1000 });
        },

        onScanLiveupdate: function(oEvent) {
            // User can implement the validation about inputting value
        },

        onAfterRendering: function() {
            // Reset the scan result
            var oScanButton = this.getView().byId('BarcodeScannerButton');
            if (oScanButton) {
                $(oScanButton.getDomRef()).on("click", function(){
                    //oScanResultText.setText('');
                    this.getModel("newObjectView").setProperty("/barcode", "");
                    //this.getView().byId("barcodeInput").setValue('');
                }.bind(this));
            }
        },

        handleDateChange: function (oEvent) {
			var 
				oDP = oEvent.getSource(),	
				bValid = oEvent.getParameter("valid");

			
			if (bValid) {
				oDP.setValueState(ValueState.None);
			} else {
				oDP.setValueState(ValueState.Error);
			}
		},

        onPressSave: function(oEvent){
            this.setAppBusy(true);

            let oModel           = this.getModel("newObjectView").getData(),
                oObjectPreParcel = this._createObjectCargoReceipt(oModel);
            
            this.getModel().create("/CargoReceipt", oObjectPreParcel, {
                success: function(oData){

                    MessageToast.show(this.getResourceBundle().getText("messageSuccessCreateCargoReceipt"), {duration: 3000, closeOnBrowserNavigation: false});
                    this.getRouter().navTo("worklist");

                    this.getModel().refresh(true);
                    
                   
                                          

                    this.setAppBusy(false);
                }.bind(this),
                error: function(oError){
                    MessageBox.error(this.getResourceBundle().getText("messageErrorCreateCargoReceipt"));

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
            
        },

 
        _createObjectCargoReceipt: function(sModel){
            let Model = {
                awb: this._clearFormatting(sModel.awb),
                hawb: this._clearFormatting(sModel.hawb),     
                ruc: this._clearFormatting(sModel.ruc),
                declaracaoNr: sModel.declaracaoNr,
                transit: sModel.transit,
                express: sModel.express,
                manualCargo: sModel.manualCargo,
                dseManual: sModel.dseManual,            
                volume: sModel.volume,   
                conteudo: sModel.conteudo,   
                bagDesacomp: sModel.bagDesacomp,
                ncm: this._clearFormatting(sModel.ncm),
                image: sModel.image,
                barcode: sModel.barcode
            
            }
            if (sModel.preParcel)       Model.preParcel     = { ID: sModel.preParcel };
            if (sModel.pesoBruto)       Model.pesoBruto     = this._clearFormatting(Formatter.numberUnit(sModel.pesoBruto));
            if (sModel.pesoLiquido)     Model.pesoLiquido   = this._clearFormatting(Formatter.numberUnit(sModel.pesoLiquido));
            if (sModel.tara)            Model.tara   = this._clearFormatting(Formatter.numberUnit(sModel.tara));
            if (sModel.declaracao)      Model.declaracao    = { declaracao: sModel.declaracao };
            if (sModel.origemAwb)       Model.origemAwb     = { ID: sModel.origemAwb };
            if (sModel.destinoAwb)      Model.destinoAwb    = { ID: sModel.destinoAwb };
            if (sModel.origemHawb)      Model.origemHawb    = { ID: sModel.origemHawb };
            if (sModel.destinoHawb)     Model.destinoHawb   = { ID: sModel.destinoHawb };
            if (sModel.airline)         Model.airline       = { ID: sModel.airline };
   
     


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

