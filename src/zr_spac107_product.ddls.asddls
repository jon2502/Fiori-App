@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'data definition'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC107_PRODUCT as select from zspac107_product
{
    key product_id as ProductId,
    product_name as ProductName,
    product_desctiption as ProductDesctiption,
    price as Price
}
