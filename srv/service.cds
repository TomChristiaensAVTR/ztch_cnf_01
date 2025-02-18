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
    @odata.draft.enabled
    entity WorkTypes as
        projection on my.WorkTypes;

    @odata.draft.enabled
    entity Users as
        projection on my.Users;

    @odata.draft.enabled
    entity Plants as
        projection on my.Plants;

    @odata.draft.enabled
    entity Locations as
        projection on my.Locations;

    @odata.draft.enabled
    entity Confirmations as
        projection on my.Confirmations
        actions
        {
            action Start();
            action Stop();
        };
}

annotate admin with @requires :
[
    'authenticated-user'
];
