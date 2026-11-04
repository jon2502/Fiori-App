@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'data definition'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_SPAC107_STOCK as select from zspac107_stock
{
    key warehouse_id as WarehouseId,
    product_id as ProductId,
    amount as Amount
}
