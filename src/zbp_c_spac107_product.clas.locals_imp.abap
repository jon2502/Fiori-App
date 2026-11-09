CLASS lhc_ZC_SPAC107_PRODUCT DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR zc_spac107_product RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION

      REQUEST requested_authorizations FOR zc_spac107_product RESULT result.

ENDCLASS.

CLASS lhc_ZC_SPAC107_PRODUCT IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

ENDCLASS.
