sap.ui.define([
    "./BaseController",
    "sap/ui/model/json/JSONModel",
    "sap/ui/core/routing/History",
    "../model/formatter",
    "../model/newObject",
    "sap/m/ColumnListItem",
	"sap/m/Label",
	"sap/m/Token",
	"sap/ui/core/Fragment",
    "sap/ui/core/Core",
	"sap/ui/core/library",
    "sap/m/MessageToast"
], function (BaseController, JSONModel, History, formatter, NewObject, ColumnListItem, Label, Token, Fragment, Core, CoreLibrary, MessageToast) {
    "use strict";
    var ValueState = CoreLibrary.ValueState;
    return BaseController.extend("capdemogru.app.cargoreceipt.controller.NewObject", {

        formatter: formatter,

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
            var oResourceBundle = this.getResourceBundle();
            var sPreviousHash = History.getInstance().getPreviousHash();
            if (sPreviousHash !== undefined) {
                // eslint-disable-next-line sap-no-history-manipulation
                history.go(-1);
            } else {
                this.getRouter().navTo("worklist", {}, true);
            }
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
                    this.getView().byId("barcodeInput").setValue(oEvent.getParameter("text"));
                } else {
                    this.getModel("newObjectView").setProperty("/barcode", "");
                    this.getView().byId("barcodeInput").setValue('');
                    
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
                    this.getView().byId("barcodeInput").setValue('');
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

        /**
         * Binds the view to the object path.
         * @function
         * @param {string} sObjectPath path to the object to be bound
         * @private
         */
        _bindView : function (sObjectPath) {
            var oViewModel = this.getModel("newObjectView");

            this.getView().bindElement({
                path: sObjectPath,
                parameters:{
                    expand: 'declaracao,origemAwb,destinoAwb,origemHawb,destinoHawb,airline'
                },
                events: {
                    change: this._onBindingChange.bind(this),
                    dataRequested: function () {
                        oViewModel.setProperty("/busy", true);
                    },
                    dataReceived: function () {
                        oViewModel.setProperty("/busy", false);
                    }
                }
            });
        },

        _onBindingChange : function () {
            var oView = this.getView(),
                oViewModel = this.getModel("newObjectView"),
                oElementBinding = oView.getElementBinding();

            // No data for the binding
            if (!oElementBinding.getBoundContext()) {
                this.getRouter().getTargets().display("objectNotFound");
                return;
            }

            var oResourceBundle = this.getResourceBundle(),
                oObject = oView.getBindingContext().getObject(),
                sObjectId = oObject.awb,
                sObjectName = oObject.Parcel;

                oViewModel.setProperty("/busy", false);
                oViewModel.setProperty("/shareSendEmailSubject",
                    oResourceBundle.getText("shareSendEmailObjectSubject", [sObjectId]));
                oViewModel.setProperty("/shareSendEmailMessage",
                    oResourceBundle.getText("shareSendEmailObjectMessage", [sObjectName, sObjectId, location.href]));
        }
    });

});
