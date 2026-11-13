CLASS lhc_ZR_SPAC107_STOCK DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR zr_spac107_stock RESULT result.

ENDCLASS.

CLASS lhc_ZR_SPAC107_STOCK IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
