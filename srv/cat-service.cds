using capdemogru as capdemogru from '../db/data-model';

service CatalogService {// @( requires:'authenticated-user') {
    // Serviços para criação de APP FIORI DE CADASTROS
    @odata.draft.enabled : true
    entity Airport   as projection on capdemogru.Airport;
   
    @readonly
    entity PartnerType as projection on capdemogru.PartnerType;

    @readonly
    entity Declaracao as projection on capdemogru.Declaracao;
    
    @odata.draft.enabled : true
    entity Package as projection on capdemogru.Package;

    @odata.draft.enabled : true
    entity Airline as projection on capdemogru.Airline;

    @odata.draft.enabled : true
    entity Partner as projection on capdemogru.Partner;

    entity Parcel  as projection on capdemogru.PreParcel {
        *,
        airline : redirected to Airline,
        declaracao: redirected to Declaracao,
        package: redirected to Package,
        cobranca: redirected to PartnerType,
        transportador: redirected to Partner,
        exportador: redirected to Partner,
        agente: redirected to Partner,
        
        
    };
   entity Danfe as projection on capdemogru.Danfe;

   entity Natureza as projection on capdemogru.Natureza;
  
   entity CargoReceipt as projection on capdemogru.CargoReceipt;

    type returnWeight {
        pesoBruto   : Decimal(15,3);
        pesoLiquido : Decimal(15,3);
        tara        : Decimal(15,3);
    }

   function getWeight() returns returnWeight;

}