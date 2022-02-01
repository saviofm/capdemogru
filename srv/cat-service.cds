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
    
    @odata.draft.enabled : true
    entity PreParcel  as projection on capdemogru.PreParcel {
        *,
        airline : redirected to Airline,
        declaracao: redirected to Declaracao,
        package: redirected to Package,
        origemAwb: redirected to Airport,       
        destinoAwb: redirected to Airport,
        origemHawb: redirected to Airport,
        destinoHawb: redirected to Airport,
        cobranca: redirected to PartnerType,
        transportador: redirected to Partner,
        exportador: redirected to Partner,
        agente: redirected to Partner,
        
    };
   


@cds.redirection.target
    entity Parcel  as projection on capdemogru.PreParcel {
        *,
        airline : redirected to Airline,
        declaracao: redirected to Declaracao,
        package: redirected to Package,
        origemAwb: redirected to Airport,       
        destinoAwb: redirected to Airport,
        origemHawb: redirected to Airport,
        destinoHawb: redirected to Airport,
        cobranca: redirected to PartnerType,
        transportador: redirected to Partner,
        exportador: redirected to Partner,
        agente: redirected to Partner,
        
    };
   entity Danfe as projection on capdemogru.Danfe;

   entity CargoReceipt as projection on capdemogru.CargoReceipt;

}