sap.ui.define([], function () {
    "use strict";

    return {

        /**
         * Rounds the number unit value to 2 digits
         * @public
         * @param {string} sValue the number string to be rounded
         * @returns {string} sValue with 2 digits rounded
         */
        numberUnit : function (sValue) {
            if (!sValue) {
                return "";
            }
            return parseFloat(sValue).toFixed(2);
        },
        ncm : function (sValue) {
            if (!sValue) {
                return "";
            }
            return `${sValue.substring(0,4)}.${sValue.substring(4,6)}.${sValue.substring(6,8)}`;  
        },

        cnpj : function (sValue) {
            if (!sValue) {
                return "";
            }    
            sValue =  sValue.padStart(14, "0")
            return `${sValue.substring(0,2)}.${sValue.substring(2,5)}.${sValue.substring(5,8)}/${sValue.substring(8,12)}-${sValue.substring(12,14)}`;
        },

        cpf : function (sValue) {
            if (!sValue) {
                return "";
            }  
            sValue =  sValue.padStart(11, "0")
            return `${sValue.substring(0,3)}.${sValue.substring(3,6)}.${sValue.substring(6,9)}-${sValue.substring(9,11)}-${sValue.substring(12,14)}`;
        },

        awb : function (sValue) {
            if (!sValue) {
                return "";
            }
            
            sValue =  sValue.padStart(11, "0")
            return `${sValue.substring(0,3)}-${sValue.substring(3,11)}`;
        
        }

    };

});