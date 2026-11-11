@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_SPAC107_STOCK as projection on ZR_SPAC107_STOCK
association[1..1] to zspac107_product as _Product on $projection.ProductId = _Product.product_id
association[1..1] to zspac107_loc as _Warehouse on $projection.WarehouseId = _Warehouse.warehouse_id

{
    key WarehouseId,
    key ProductId,
    Amount,
    Location,
    ProductName,
    _Warehouse,
    _Product

}
