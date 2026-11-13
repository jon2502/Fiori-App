@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view for location'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true

define root view entity ZC_SPAC107_LOC 
    provider contract transactional_query as projection on ZR_SPAC107_LOC
{
    key WarehouseId,
    Address,
    PostCode,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt

}
