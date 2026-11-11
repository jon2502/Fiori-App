@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'data definition'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC107_STOCK as select from zspac107_stock
association[1..1] to zspac107_product as _Product on $projection.ProductId = _Product.product_id
association[1..1] to zspac107_loc as _Warehouse on $projection.WarehouseId = _Warehouse.warehouse_id

{
    key warehouse_id as WarehouseId,
    key product_id as ProductId,
    amount as Amount,
    _Warehouse.post_code as Location,
    _Product.product_name as ProductName,
    _Warehouse,
    _Product
}
