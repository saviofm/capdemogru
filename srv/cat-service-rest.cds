using CatalogService as CatalogService from './cat-service';



@protocol : 'rest'
service CatalogServiceRest {
    entity Airport as projection on CatalogService.Airport;

    entity Expenses as projection on CatalogService.Expenses;

    entity ExpensesAnalytics as projection on CatalogService.ExpensesAnalytics;

}