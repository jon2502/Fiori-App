@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'data definition'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_SPAC107_STOCK as select from zspac107_stock
association[1..1] to zspac107_product as _Product on $projection.product_id = _Product.product_id
association[1..1] to zspac107_loc as _Warehouse on $projection.warehouse_id = _Warehouse.warehouse_id

{
    key warehouse_id,
    key product_id,
    _Warehouse.address as Location,
    _Product.product_name as productName,
    amount as Amount
}
