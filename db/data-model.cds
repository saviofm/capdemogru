using {
  cuid,
  managed,
  sap,
  temporal,
  Currency,
  User
} from '@sap/cds/common';


namespace capdemogru;

//----------------------- Airport  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
entity Airport : cuid , managed {
      iata              : String(3) not null;
      icao              : String(4) not null;
      airportDescription : localized String not null;
      location          : String not null;
      country           : String not null;
}

//Annotation
annotate Airport with @(
  title              : '{i18n>Airport}',
  description        : '{i18n>Airport}',
  UI.TextArrangement : #TextOnly,
  cds.odata.valuelist,
  Common.SemanticKey : [iata],
  UI.Identification  : [{
    $Type : 'UI.DataField',
    Value : iata
  }]
) {
  ID @(
        Core.Computed,
        Common.Text : {
            $value                 : iata,
            ![@UI.TextArrangement] : #TextOnly
        }
  );
  iata            @(
    title       : '{i18n>iata}',
    description : '{i18n>iata}',
    Common      : {
        FieldControl             : #Mandatory,
    //  Text : {
    //    $value                 : airportDescription,
    //    ![@UI.TextArrangement] : #TextLast
    //  }
    }
  );
  icao            @(
    Common      : {
        FieldControl             : #Mandatory
    }, 
    title       : '{i18n>icao}',
    description : '{i18n>icao}'
  );
  airportDescription @(
    title       : '{i18n>airportDescription}',
    description : '{i18n>airportDescription}',
    Common      : {
      FieldControl : #Mandatory,
      TextFor      : iata
    }
  );
  location            @(
    title       : '{i18n>location}',
    description : '{i18n>location}',
    Common      : {
        FieldControl             : #Mandatory
    }, 
  );
  country            @(
    title       : '{i18n>country}',
    description : '{i18n>country}',
    Common      : {
        FieldControl             : #Mandatory
    }
  );
};

//---------------- Tipo Parceiro -----------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
@cds.odata.valuelist
entity PartnerType  {
  key partnerTypeCode        : String(2) not null;
  partnerTypeCodeDescription : localized String not null;
}

//Annotation
annotate PartnerType with @(
  title              : '{i18n>PartnerType}',
  description        : '{i18n>PartnerType}',
  UI.TextArrangement : #TextOnly,
  cds.odata.valuelist,
  Common.SemanticKey : [partnerTypeCode],
  UI.Identification  : [{
    $Type : 'UI.DataField',
    Value : partnerTypeCode
  }]
) {
  partnerTypeCode            @(
    title       : '{i18n>partnerTypeCode}',
    description : '{i18n>partnerTypeCode}',
    Common      : {
      Text : {
        $value                 : partnerTypeCodeDescription,
        ![@UI.TextArrangement] : #TextLast
      }
    }
  );
  partnerTypeCodeDescription @(
    title       : '{i18n>partnerTypeCodeDescription}',
    description : '{i18n>partnerTypeCodeDescription}',
    Common      : {
      FieldControl : #Mandatory,
      TextFor      : partnerTypeCode
    }
  );
};

//------------------- Declaração -----------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
@cds.odata.valuelist
entity Declaracao {
  key declaracao        : String(3) not null;
  declaracaoDescription : localized String not null;
}

//Annotation
annotate Declaracao with @(
  title              : '{i18n>Declaracao}',
  description        : '{i18n>Declaracao}',
  cds.odata.valuelist,
  Common.SemanticKey : [declaracao],
  UI.Identification  : [{
    $Type : 'UI.DataField',
    Value : declaracao
  }]
) {
  declaracao            @(
    title       : '{i18n>Declaracao}',
    description : '{i18n>Declaracao}',
    Common      : {
        FieldControl : #Mandatory,
        //Text : {
        //    $value                 : declaracaoDescription,
        //    ![@UI.TextArrangement] : #TextLast
        //}
    }
  );
  declaracaoDescription @(
    title       : '{i18n>declaracaoDescription}',
    description : '{i18n>declaracaoDescription}',
    Common      : {
      FieldControl : #Mandatory,
      TextFor      : declaracao
    }
  );
};



//---------------------- Package -----------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
@cds.odata.valuelist
entity Package : cuid, managed {
  packageCode        : String(4) not null;
  packageDescription : localized String not null;
}

//Annotation
annotate Package with @(
    title              : '{i18n>Package}',
    description        : packageCode,
    UI.TextArrangement : #TextOnly,
    cds.odata.valuelist,
    Common.SemanticKey : [packageCode],
    UI.Identification  : [{
        $Type : 'UI.DataField',
        Value : packageCode

    }]
) {
    ID             @(
        Core.Computed,
        Common.Text : {
            $value                 : packageDescription,
            ![@UI.TextArrangement] : #TextOnly
        }
    );
    packageCode           @(
        title       : '{i18n>packageCode}',
        description : '{i18n>packageCode}',
        Common      : {
            FieldControl             : #Mandatory,
            //TextFor : ID,
            Text : {
                $value                 : packageDescription,
                ![@UI.TextArrangement] : #TextLast
            }    
        }
    );
    packageDescription    @(
        title       : '{i18n>packageDescription}',
        description : '{i18n>packageDescription}',
        Common      : {
            FieldControl : #Mandatory,
            TextFor : packageCode
        }
    );
};


//-------------------- Airline ----------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
@cds.odata.valuelist
entity Airline : cuid, managed {
  airlineCode       : String(4) not null;
  airlineDescription : localized String not null;
}

//Annotation
annotate Airline with @(
    title              : '{i18n>Airline}',
    description        : airlineCode,
    UI.TextArrangement : #TextOnly,
    cds.odata.valuelist,
    Common.SemanticKey : [airlineCode],
    UI.Identification  : [{
        $Type : 'UI.DataField',
        Value : airlineCode

    }]
) {
    ID             @(
        Core.Computed,
        Common.Text : {
            $value                 : airlineCode,
            ![@UI.TextArrangement] : #TextOnly

        }
    );
    airlineCode           @(
        title       : '{i18n>airlineCode}',
        description : '{i18n>airlineCode}',
        Common      : {
            FieldControl             : #Mandatory,
            TextFor : ID
        }
    );
    airlineDescription    @(
        title       : '{i18n>airlineDescription}',
        description : '{i18n>airlineDescription}',
        Common      : {
            FieldControl             : #Mandatory,
            TextFor : airlineCode
        }
    );
};


//----------------------- Partner ----------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
entity Partner : cuid, managed {
  CNPJCPF           : String(14) not null;
  partnerDescription  : String not null;
}
//Annotation
annotate Partner with @(
    title              : '{i18n>Partner}',
    description        : CNPJCPF,
    UI.TextArrangement : #TextOnly,
    cds.odata.valuelist,
    Common.SemanticKey : [CNPJCPF],
    UI.Identification  : [{
        $Type : 'UI.DataField',
        Value : CNPJCPF

    }]
) {
    ID             @(
        Core.Computed,
        Common.Text : {
            $value                 : CNPJCPF,
            ![@UI.TextArrangement] : #TextOnly
        }
    );
    CNPJCPF           @(
        title       : '{i18n>CNPJCPF}',
        description : '{i18n>CNPJCPF}',
        Common      : {
            FieldControl             : #Mandatory,
            TextFor                  : ID
        }
    );
    partnerDescription    @(
        title       : '{i18n>partnerDescription}',
        description : '{i18n>partnerDescription}',
        Common      : {
            FieldControl             : #Mandatory
        //    TextFor                  : CNPJCPF
        }
    );
};




//----------------------- PreParcel -----------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
entity PreParcel : cuid, managed {
  awb                 : String(11) not null;
  hawb                : String(20);
  declaracao          : Association to one Declaracao;
  declaracaoNr        : String(15);
  ruc                 : String not null;
  transit             : Boolean;
  airTransit          : Boolean;
  origemAwb           : Association to one Airport;
  destinoAwb          : Association to one Airport;
  origemHawb          : Association to one Airport;
  destinoHawb         : Association to one Airport;
  transDoc            : String;
  dtEmissaoDAT        : Date;
  cpfDriver           : String @assert.format : '[0-9]+';
  dseManual           : Boolean;
  airline             : Association to one Airline;
  express             : Boolean;
  pesoBruto           : Decimal(15,3);
  volume              : Integer;
  package             : Association to one Package;    
  conteudo            : String;   
  bagDesacomp         : Boolean;
  exportador          : Association to one Partner; 
  agente              : Association to one Partner;
  transportador       : Association to one Partner;
  cobranca            : Association to one PartnerType;
  natureza            : String;
  ncm                 : String;
  obs                 : LargeString;
  confirm             : Boolean;
}

//Annotation
annotate PreParcel with @(
    title              : '{i18n>PreParcel}',
    description        : awb,
    UI.TextArrangement : #TextLast,
    cds.odata.valuelist,
    Common.SemanticKey : [awb],
    UI.Identification  : [{
        $Type : 'UI.DataField',
        Value : awb

    }]
) {
    ID             @(
        title       : 'ID',
        description : 'ID',
        Core.Computed,
        Common.Text : {
            $value                 : awb,
            ![@UI.TextArrangement] : #TextFirst
        }
    );
    awb           @(
        title       : '{i18n>awb}',
        description : '{i18n>awb}',
        Common      : {
            FieldControl             : #Mandatory,
            TextFor                  : ID
        }
    );
    hawb           @(
        title       : '{i18n>hawb}',
        description : '{i18n>hawb}',
        //Common      : {
        //    FieldControl             : #Mandatory,
        //   TextFor                  : ID
        //}
    );
    declaracao    @(
        title       : '{i18n>declaracao}',
        description : '{i18n>declaracao}',
        Common      : {
            FieldControl             : #Mandatory,
            Label : '{i18n>declaracao}',
            ValueList : {
                CollectionPath  : 'Declaracao',
                Parameters      : [
                    {

                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : 'declaracao_declaracao',
                        ValueListProperty : 'declaracao'
                    },          
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'declaracaoDescription'
                    }
                ]
            }   
        }
    );
    declaracaoNr @(
        title       : '{i18n>declaracaoNr}',
        description : '{i18n>declaracaoNr}',
        Common      : {
            FieldControl             : #Mandatory
        }
    );
    ruc @(
        title       : '{i18n>ruc}',
        description : '{i18n>ruc}',
        Common      : {
            FieldControl             : #Mandatory
        }
    );
    transit       @(
        title       : '{i18n>transit}',
        description : '{i18n>transit}',
    );
    airTransit    @(
        title       : '{i18n>airTransit}',
        description : '{i18n>airTransit}'
    );
    origemAwb @(
        title       : '{i18n>origemAwb}',
        description : '{i18n>origemAwb}',
        Common      : {
            Text : {
                $value                 :  origemAwb.airportDescription,
                ![@UI.TextArrangement] : #TextOnly
            },
            ValueList : {
                CollectionPath  : 'Airport',
                Label : '{i18n>Airport}',
                Parameters      : [
                    {

                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : 'origemAwb_ID',
                        ValueListProperty : 'ID'
                    },          
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'iata'
                    },
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'airportDescription'
                    }
                ]
            }   
        }
    );
    destinoAwb @(
        title       : '{i18n>destinoAwb}',
        description : '{i18n>destinoAwb}',
        Common      : {
            Text : {
                $value                 :  destinoAwb.airportDescription,
                ![@UI.TextArrangement] : #TextOnly
            },
            ValueList : {
                CollectionPath  : 'Airport',
                Label : '{i18n>Airport}',
                Parameters      : [
                    {

                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : 'destinoAwb_ID',
                        ValueListProperty : 'ID'
                    },          
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'iata'
                    },
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'airportDescription'
                    }
                ]
            }   
        }
    );
    origemHawb @(
        title       : '{i18n>origemHawb}',
        description : '{i18n>origemHawb}',
        Common      : {
            Text : {
                $value                 :  origemHawb.airportDescription,
                ![@UI.TextArrangement] : #TextOnly
            },
            ValueList : {
                CollectionPath  : 'Airport',
                Label : '{i18n>Airport}',
                Parameters      : [
                    {

                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : 'origemHawb_ID',
                        ValueListProperty : 'ID'
                    },          
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'iata'
                    },
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'airportDescription'
                    }
                ]
            }   
        }
    );
    destinoHawb @(
        title       : '{i18n>destinoHawb}',
        description : '{i18n>destinoHawb}',
        Common      : {
            Text : {
                $value                 :  destinoHawb.airportDescription,
                ![@UI.TextArrangement] : #TextOnly
            },
            ValueList : {
                CollectionPath  : 'Airport',
                Label : '{i18n>Airport}',
                Parameters      : [
                    {

                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : 'destinoHawb_ID',
                        ValueListProperty : 'ID'                   
                    },          
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'iata'
                    },
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'airportDescription'
                    }
                ]
            }   
        }
    );
  
    transDoc @(
        title       : '{i18n>transDoc}',
        description : '{i18n>transDoc}'
    );
    dtEmissaoDAT @(
        title       : '{i18n>dtEmissaoDAT}',
        description : '{i18n>dtEmissaoDAT}'
    );
    cpfDriver @(
        title       : '{i18n>cpfDriver}',
        description : '{i18n>cpfDriver}'
    );
    dseManual @(
        title       : '{i18n>dseManual}',
        description : '{i18n>dseManual}'
    );
    airline  @(
        title       : '{i18n>airline}',
        description : '{i18n>airline}',
        Common      : {
            FieldControl             : #Mandatory,
            Label : '{i18n>Airline}',
            Text : {
                $value                 :  airline.airlineDescription,
                ![@UI.TextArrangement] : #TextOnly
            },
            ValueList : {
                CollectionPath  : 'Airline',
                Label : '{i18n>Airline}',
                Parameters      : [
                    {

                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : 'airline_ID',
                        ValueListProperty : 'ID'
                    },          
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'airlineDescription'
                    }
                ]
            }   
        }
    );
    express @(
        title       : '{i18n>express}',
        description : '{i18n>express}'
    );
    pesoBruto @(
        title       : '{i18n>pesoBruto}',
        description : '{i18n>pesoBruto}'
    );
    volume @(
        title       : '{i18n>volume}',
        description : '{i18n>volume}'
    );
    package @(
        title       : '{i18n>package}',
        description : '{i18n>package}',
        Common      : {
            FieldControl             : #Mandatory,
            Text : {
                $value                 :  package.packageDescription,
                ![@UI.TextArrangement] : #TextOnly
            },
            ValueList : {
                CollectionPath  : 'Package',
                Label : '{i18n>package}',                
                Parameters      : [
                    {

                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : 'package_ID',
                        ValueListProperty : 'ID'
                    },          
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'packageDescription'
                    }
                ]
            }   
        }
    );
      
    conteudo   @(
        title       : '{i18n>conteudo}',
        description : '{i18n>conteudo}'
    );
    bagDesacomp    @(
        title       : '{i18n>bagDesacomp}',
        description : '{i18n>bagDesacomp}'
    );
    exportador @(
        title       : '{i18n>exportador}',
        description : '{i18n>exportador}',
        Common      : {
            FieldControl             : #Mandatory,
            ValueList : {
                CollectionPath  : 'Partner',
                Label : '{i18n>exportador}',  
                Parameters      : [
                    {

                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : 'exportador_ID',
                        ValueListProperty : 'ID'
                    },          
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'partnerDescription'
                    }
                ]
            }   
        }
    );     
   agente @(
        title       : '{i18n>agente}',
        description : '{i18n>agente}',
        Common      : {
            FieldControl             : #Mandatory,
            ValueList : {
                CollectionPath  : 'Partner',
                Label : '{i18n>agente}',  
                Parameters      : [
                    {
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : 'agente_ID',
                        ValueListProperty : 'ID'
                    },          
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'partnerDescription'
                    }
                ]
            }   
        }
    );     
  transportador @(
        title       : '{i18n>transportador}',
        description : '{i18n>transportador}',
        Common      : {
            FieldControl             : #Mandatory,
            ValueList : {
                CollectionPath  : 'Partner',
                Label : '{i18n>transportador}',  
                Parameters      : [
                    {
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : 'transportador_ID',
                        ValueListProperty : 'ID'
                    },          
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'partnerDescription'
                    }
                ]
            }   
        }
    ); 
  cobranca @(
        title       : '{i18n>cobranca}',
        description : '{i18n>cobranca}',
        Common      : {
            FieldControl             : #Mandatory,
            ValueList : {
                CollectionPath  : 'PartnerType',
                Label : '{i18n>PartnerType}', 
                Parameters      : [
                    {
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : 'cobranca_partnerTypeCode',
                        ValueListProperty : 'partnerTypeCode'
                    },          
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'partnerTypeCodeDescription'
                    }
                ]
            }   
        }
    ); 
    natureza   @(
        title       : '{i18n>natureza}',
        description : '{i18n>natureza}'
    );          
    ncm @(
        title       : '{i18n>ncm}',
        description : '{i18n>ncm}'
    );         
    obs   @(
        title       : '{i18n>obs}',
        description : '{i18n>obs}',
        UI.MultiLineText : true,
    );          
    confirm   @(
        title       : '{i18n>confirm}',
        description : '{i18n>confirm}'
    );          
};

