using CatalogService as CatalogService from './cat-service';



@protocol : 'rest'
service CatalogServiceRest {
    entity Airport as projection on CatalogService.Airport;

  
}