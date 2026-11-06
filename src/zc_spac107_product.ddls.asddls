
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'data definition for product'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_SPAC107_PRODUCT as select from zspac107_product
{

  key product_id as productId,
  product_name  as ProductName,
  product_desctiption as ProductDescription,
  price as Price
   
}
