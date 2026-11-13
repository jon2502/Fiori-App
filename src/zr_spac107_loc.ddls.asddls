@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'data definition for locations'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC107_LOC as select from zspac107_loc
{
    key warehouse_id as WarehouseId,
    address as Address,
    post_code as PostCode,
    @Semantics.user.createdBy: true
    local_created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    local_created_at as CreatedAt,
    @Semantics.user.lastChangedBy: true
    local_last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt
}
