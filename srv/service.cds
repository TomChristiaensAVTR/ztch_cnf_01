using { eagle.cnf01 as my } from '../db/schema.cds';

using { NorthWind as external } from './external/NorthWind.csn';

@path : '/service/catalog'
service CatalogService
{
    @readonly
    entity Products as
        projection on external.Products
        {
            key ID,
            Name,
            Description,
            ReleaseDate,
            DiscontinuedDate,
            Rating,
            Price
        };
}

annotate CatalogService with @requires :
[
    'authenticated-user'
];

@path : '/service/admin'
service admin
{
    @odata.draft.bypass
    @odata.draft.enabled
    entity CnfWorkTypes as
        projection on my.CnfWorkTypes;

    @odata.draft.bypass
    @odata.draft.enabled
    entity CnfStatusses as
        projection on my.CnfStatusses;

    @odata.draft.bypass
    @odata.draft.enabled
    entity Confirmations as
        projection on my.Confirmations
        actions
        {
            action Start();
            action Stop();
            action Cancel();
        };

    @odata.draft.bypass
    @odata.draft.enabled
    entity CnfIndLabTasks as
        projection on my.CnfIndLabTasks;   

    @odata.draft.bypass
    @odata.draft.enabled
    entity Users as
        projection on my.Users;

    @odata.draft.bypass
    @odata.draft.enabled
    entity Plants as
        projection on my.Plants;

    @odata.draft.bypass
    @odata.draft.enabled
    entity Locations as
        projection on my.Locations;        
}

annotate admin with @requires :
[
    'authenticated-user'
];
