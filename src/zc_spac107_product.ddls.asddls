@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_SPAC107_PRODUCT as projection on ZR_SPAC107_PRODUCT
{
    key ProductId,
    ProductName,
    ProductDesctiption,
    Price,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt
}
