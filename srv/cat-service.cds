using capdemowm as capdemowm from '../db/data-model';

service CatalogService {// @( requires:'authenticated-user') {
    // Serviços para criação de APP FIORI DE CADASTROS
    @odata.draft.enabled : true
    entity Airport   as projection on capdemowm.Airport;
   
    @readonly
    entity PartnerType as projection on capdemowm.PartnerType;

    @readonly
    entity Declaracao as projection on capdemowm.Declaracao;
    
    @odata.draft.enabled : true
    entity Package as projection on capdemowm.Package;

    @odata.draft.enabled : true
    entity Airline as projection on capdemowm.Airline;

    @odata.draft.enabled : true
    entity Partner as projection on capdemowm.Partner;

    entity Parcel  as projection on capdemowm.PreParcel {
        *,
        airline : redirected to Airline,
        declaracao: redirected to Declaracao,
        package: redirected to Package,
        cobranca: redirected to PartnerType,
        transportador: redirected to Partner,
        exportador: redirected to Partner,
        agente: redirected to Partner,
        
        
    };
   entity Danfe as projection on capdemowm.Danfe;

   entity Natureza as projection on capdemowm.Natureza;
  
   entity CargoReceipt as projection on capdemowm.CargoReceipt;

    type returnWeight {
        pesoBruto   : Decimal(15,3);
        pesoLiquido : Decimal(15,3);
        tara        : Decimal(15,3);
    }

   function getWeight() returns returnWeight;

}