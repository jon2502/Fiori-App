CLASS lhc_ZR_SPAC107_PRODUCT DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR zr_spac107_product RESULT result.

ENDCLASS.

CLASS lhc_ZR_SPAC107_PRODUCT IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
