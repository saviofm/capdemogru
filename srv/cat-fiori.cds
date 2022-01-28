using CatalogService from './cat-service';

//----------------------- Airport  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//List Page
annotate CatalogService.Airport with @(
	UI: {
        LineItem: [
			{   
                $Type: 'UI.DataField', 
                Value: iata,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : icao,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : airportDescription,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : location,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : country,
                ![@UI.Importance] : #High
            },
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : iata}]
        },
        SelectionFields: [ 
            iata,
            icao,
            airportDescription,
            location,
            country
        ],
	},
//Object Page
	UI: {
        HeaderInfo: {          
            Title : { 
                $Type : 'UI.DataField',
                Value: '{i18n>Airport}'
            },
            TypeName: '{i18n>Airport}',
            TypeNamePlural: '{i18n>Airport_plural}', 
            Description: { 
                $Type: 'UI.DataField', 
                Value: airportDescription 
            }, 
        },
		HeaderFacets            : [
            {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#Admin',
                ![@UI.Importance] : #Medium
            }
        ],
        FieldGroup #GeneralData: {
			Data: [
                {
                    $Type : 'UI.DataField',
                    Value: iata
                },
                {
                    $Type : 'UI.DataField',
                    Value: icao
                }, 
                {
                    $Type : 'UI.DataField',
                    Value: airportDescription
                },              
				{
                    $Type : 'UI.DataField',
                    Value: location
                },
                {
                    $Type : 'UI.DataField',
                    Value: country
                }, 
			]                        
        },
        FieldGroup #Admin: {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : createdBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : createdAt
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedAt
                }
            ]
        },
        // Page Facets
		Facets: [
            {    
                $Type: 'UI.ReferenceFacet', 
                Label: '{i18n>GeneralData}', 
                Target: '@UI.FieldGroup#GeneralData'
            }
        ]    
    }
);


//--------------------- PartnerType --------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//List Page
annotate CatalogService.PartnerType with @(
	UI: {
        LineItem: [
			{   
                $Type: 'UI.DataField', 
                Value: partnerTypeCode,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : partnerTypeCodeDescription,
                ![@UI.Importance] : #High
            }
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : partnerTypeCode}]
        },
        SelectionFields: [ 
            partnerTypeCode,
            partnerTypeCodeDescription
        ],
	},
//Object Page
	UI: {
        HeaderInfo: {          
            Title : { 
                $Type : 'UI.DataField',
                Value: '{i18n>PartnerType}'
            },
            TypeName: '{i18n>PartnerType}',
            TypeNamePlural: '{i18n>PartnerType_plural}', 
            Description: { 
                Value: partnerTypeCode 
            }, 
        },
        FieldGroup #GeneralData: {
			Data: [
                {
                    $Type : 'UI.DataField',
                    Value: partnerTypeCode
                },
				{
                    $Type : 'UI.DataField',
                    Value: partnerTypeCodeDescription
                }
			]                        
        },
        // Page Facets
		Facets: [
            {    
                $Type: 'UI.ReferenceFacet', 
                Label: '{i18n>GeneralData}', 
                Target: '@UI.FieldGroup#GeneralData'
            }
        ]      
    }
);



//---------------------- Declaração ----------------------//
//------------------------------------------------------//
//------------------------------------------------------//
annotate CatalogService.Declaracao with @(
//List Page
	UI: {
        LineItem: [
			{   
                $Type: 'UI.DataField', 
                Value: declaracao,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : declaracaoDescription,
                ![@UI.Importance] : #High
            }
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : declaracao}]
        },
        SelectionFields: [ 
            declaracao,
            declaracaoDescription
        ]
	},
//Object Page
	UI: {
        HeaderInfo: {          
            Title : { 
                $Type : 'UI.DataField',
                Value: '{i18n>Declaracao}'
            },
            TypeName: '{i18n>Declaracao',
            TypeNamePlural: '{i18n>Declaracao_plural}', 
        },
		
        FieldGroup #GeneralData: {
			Data: [
                {
                    $Type : 'UI.DataField',
                    Value: declaracao
                },
				{
                    $Type : 'UI.DataField',
                    Value: declaracaoDescription
                },

			]                        
        },
        Facets: [
         // Page Facets
            {    
                $Type: 'UI.ReferenceFacet', 
                Label: '{i18n>GeneralData}', 
                Target: '@UI.FieldGroup#GeneralData'
            }
		],      
    }
);




//---------------------- Airline --------------------//
//------------------------------------------------------//
//------------------------------------------------------//
annotate CatalogService.Airline with @(
//List Page
	UI: {
        LineItem: [
			{   
                $Type: 'UI.DataField', 
                Value: airlineCode,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : airlineDescription,
                ![@UI.Importance] : #High
            }
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : airlineDescription} ]
        },
        SelectionFields: [ 
            airlineCode,
            airlineDescription
        ]
	},
//Object Page
	UI: {
        HeaderInfo: {          
            Title : { 
                $Type : 'UI.DataField',
                Value: ID
            },
            TypeName: '{i18n>Airline}',
            TypeNamePlural: '{i18n>Airline_plural}', 
            Description: { 
                $Type: 'UI.DataField', 
                Value: airlineDescription 
            }, 
        },
		HeaderFacets            : [
            {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#Admin',
                ![@UI.Importance] : #Medium
            }
        ],
		
        FieldGroup #GeneralData: {
			Data: [
                {
                    $Type : 'UI.DataField',
                    Value: airlineCode
                },
				{
                    $Type : 'UI.DataField',
                    Value: airlineDescription
                },

			]                        
        },
        FieldGroup #Admin: {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : createdBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : createdAt
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedAt
                }
            ]
        },
        Facets: [
         // Page Facets
            {    
                $Type: 'UI.ReferenceFacet', 
                Label: '{i18n>GeneralData}', 
                Target: '@UI.FieldGroup#GeneralData'
            }
		],      
    }
);





//----------------------- Package ----------------------//
//------------------------------------------------------//
//------------------------------------------------------//
annotate CatalogService.Package with @(
//List Page
	UI: {
        LineItem: [
			{   
                $Type: 'UI.DataField', 
                Value: packageCode,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : packageDescription,
                ![@UI.Importance] : #High
            }
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : packageCode}]
        },
        SelectionFields: [ 
            packageCode,
            packageDescription
        ],
	},
//Object Page
	UI: {
        HeaderInfo: {          
            Title : { 
                $Type : 'UI.DataField',
                Value: ID
            },
            TypeName: '{i18n>Package}',
            TypeNamePlural: '{i18n>Package_plural}', 
            Description: { 
                Value: packageDescription 
            }
        },
		 HeaderFacets            : [
            {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#Admin',
                ![@UI.Importance] : #Medium
            }
        ],
        FieldGroup #GeneralData: {
			Data: [
                {
                    $Type : 'UI.DataField',
                    Value: packageCode
                },
				{
                    $Type : 'UI.DataField',
                    Value: packageDescription
                },

			]                        
        },
        FieldGroup #Admin: {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : createdBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : createdAt
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedAt
                }
            ]
        },
        Facets: [
         // Page Facets
            {    
                $Type: 'UI.ReferenceFacet', 
                Label: '{i18n>GeneralData}', 
                Target: '@UI.FieldGroup#GeneralData'
            }
		],      
    }
);



//----------------------- Partner ----------------------//
//------------------------------------------------------//
//------------------------------------------------------//
annotate CatalogService.Partner with @(
//List Page
	UI: {
        LineItem: [
			{   
                $Type: 'UI.DataField', 
                Value: CNPJCPF,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : partnerDescription,
                ![@UI.Importance] : #High
            }
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : CNPJCPF}]
        },
        SelectionFields: [ 
            CNPJCPF,
            partnerDescription
        ],
	},
//Object Page
	UI: {
        HeaderInfo: {          
            Title : { 
                $Type : 'UI.DataField',
                Value: ID
            },
            TypeName: '{i18n>Partner}',
            TypeNamePlural: '{i18n>Partner_plural}', 
            Description: { 
                Value: partnerDescription 
            }
        },
		 HeaderFacets            : [
            {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#Admin',
                ![@UI.Importance] : #Medium
            }
        ],
        FieldGroup #GeneralData: {
			Data: [
                {
                    $Type : 'UI.DataField',
                    Value: CNPJCPF
                },
				{
                    $Type : 'UI.DataField',
                    Value: partnerDescription
                },

			]                        
        },
        FieldGroup #Admin: {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : createdBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : createdAt
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedAt
                }
            ]
        },
        Facets: [
         // Page Facets
            {    
                $Type: 'UI.ReferenceFacet', 
                Label: '{i18n>GeneralData}', 
                Target: '@UI.FieldGroup#GeneralData'
            }
		],      
    }
);


//--------------------- PreParcel ----------------------//
//------------------------------------------------------//
//------------------------------------------------------//
annotate CatalogService.PreParcel with @(
//List Page
	UI: {
    	TextArrangement     : #TextLast,
        LineItem: [                 
			{
                $Type             : 'UI.DataField',
                Value             : awb,
                ![@UI.Importance] : #High
            },
     
			{
                $Type             : 'UI.DataField',
                Value             : hawb,
                ![@UI.Importance] : #High
            },            
            {   
                $Type                   : 'UI.DataField',
                Value                   : ruc,
                ![@Common.FieldControl] : #ReadOnly,
                ![@UI.Importance]       : #High,
            },
            {   
                $Type                   : 'UI.DataField',
                Value                   : transit,
                ![@Common.FieldControl] : #ReadOnly,
                ![@UI.Importance]       : #High,
            },
            {   
                $Type                   : 'UI.DataField',
                Value                   : origemAwb_ID,
                ![@Common.FieldControl] : #ReadOnly,
                ![@UI.Importance]       : #High,
            },
            {   
                $Type                   : 'UI.DataField',
                Value                   : destinoAwb_ID,
                ![@Common.FieldControl] : #ReadOnly,
                ![@UI.Importance]       : #High,
            },
            {   
                $Type                   : 'UI.DataField',
                Value                   : airTransit,
                ![@Common.FieldControl] : #ReadOnly,
                ![@UI.Importance]       : #High,
            },
            {   
                $Type                   : 'UI.DataField',
                Value                   : airline_ID,
                ![@Common.FieldControl] : #ReadOnly,
                ![@UI.Importance]       : #High,
            },  
            {   
                $Type                   : 'UI.DataField',
                Value                   : dtEmissaoDAT,
                ![@Common.FieldControl] : #ReadOnly,
                ![@UI.Importance]       : #High,
            }, 

		],
        PresentationVariant : {SortOrder : [{
            $Type      : 'Common.SortOrderType',
            Property   : awb,
            Descending : false
        }]}
    },
//Object Header
   UI: { 
        HeaderInfo: {         
            Title: {
                $Type : 'UI.DataField',
                Value : airline.ID
            },    
            TypeName       : '{i18n>PreParcel}',
            TypeNamePlural : '{i18n>PreParcel_plural}',
            Description    : {
                Value : conteudo
            }
        },
        HeaderFacets            : [
            {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#Admin',
                ![@UI.Importance] : #Medium
            }
        ],
        FieldGroup #Admin: {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : createdBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : createdAt
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedAt
                }
            ]
        },
        FieldGroup #GeneralData : {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : awb,           
                    ![@UI.Importance]       : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : hawb,
                    ![@UI.Importance]       : #High
                },
                {
                    $Type                   : 'UI.DataField',
                    Value                   : declaracao_declaracao,
                    ![@UI.Importance]       : #High
                },
                {
                    $Type                   : 'UI.DataField',
                    Value                   : declaracaoNr,
                    ![@UI.Importance]       : #High
                },
                {
                    $Type                   : 'UI.DataField',
                    Value                   : ruc,
                    ![@UI.Importance]       : #High
                },
                {
                    $Type                   : 'UI.DataField',
                    Value                   : transit,
                    ![@UI.Importance]       : #High
                }
            ]
        },
        FieldGroup #Details : {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : origemAwb_ID,           
                    ![@UI.Importance]       : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : destinoAwb_ID,
                    ![@UI.Importance]       : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : origemHawb_ID,
                    ![@UI.Importance]       : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : destinoHawb_ID,
                    ![@UI.Importance]       : #High
                },
            ]
        },
        FieldGroup #Details2 : {
            Data : [
                 {   
                    $Type                   : 'UI.DataField',
                    Value                   : declaracao_declaracao,
                    ![@Common.FieldControl] : #ReadOnly,
                    ![@UI.Importance]       : #High
                },          
 			    {   
                    $Type                   : 'UI.DataField',
                    Value                   : declaracaoNr,
                    //![@Common.FieldControl] : #ReadOnly,
                    ![@UI.Importance]       : #High,
                },
                {
                    $Type                   : 'UI.DataField',
                    Value                   : airTransit,
                    ![@UI.Importance]       : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : transDoc,           
                    ![@UI.Importance]       : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : dtEmissaoDAT,
                    ![@UI.Importance]       : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : dseManual,
                    ![@UI.Importance]       : #High
                },

            ]
        },    
        FieldGroup #DetailsParcel : {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : airline_ID,
                    ![@UI.Importance]       : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : express,           
                    ![@UI.Importance]       : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : package_ID,
                    ![@UI.Importance]       : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : conteudo,
                    ![@UI.Importance]       : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : bagDesacomp,
                    ![@UI.Importance]       : #High
                }
            ]
        }, 
        FieldGroup #Partner : {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : exportador_ID,           
                    ![@UI.Importance]       : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : agente_ID,
                    ![@UI.Importance]       : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : transportador_ID,
                    ![@UI.Importance]       : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : cobranca_partnerTypeCode,
                    ![@UI.Importance]       : #High
                }
            ]
        }, 
        FieldGroup #Obs : {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : natureza,           
                    ![@UI.Importance]       : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : ncm,
                    ![@UI.Importance]       : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : obs,
                    
                    ![@UI.Importance]       : #High
                }
            ]
        }, 
        FieldGroup #Confirm : {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : confirm,
                    ![@UI.Importance]       : #High
                }
            ]
        }, 

    // Page Facets
        Facets : [
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>GeneralData}',
                Target : '@UI.FieldGroup#GeneralData'
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>details}',
                Target : '@UI.FieldGroup#Details'
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>details2}',
                Target : '@UI.FieldGroup#Details2'
            },     
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>detailsParcel}',
                Target : '@UI.FieldGroup#DetailsParcel'
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>Partner}',
                Target : '@UI.FieldGroup#Partner'
            }, 
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>Obs}',
                Target : '@UI.FieldGroup#Obs'
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>Confirm}',
                Target : '@UI.FieldGroup#Confirm'
            }
        ]
    }  
); 