@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'data definition'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC107_PRODUCT as select from zspac107_product
{
    key product_id as ProductId,
    product_name as ProductName,
    product_desctiption as ProductDesctiption,
    price as Price,
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
