CLASS lhc_ZR_SPAC107_LOC DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR zr_spac107_loc RESULT result.

    METHODS earlynumbering_create FOR NUMBERING
       entities FOR CREATE zr_spac107_loc.

ENDCLASS.

CLASS lhc_ZR_SPAC107_LOC IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.
      DATA max_id TYPE  int4.
    SELECT MAX( warehouse_id ) FROM zspac107_loc INTO @max_id.

    LOOP AT entities INTO DATA(entity).

        max_id += 1.

        APPEND VALUE #(
            %cid      = entity-%cid
            %is_draft = entity-%is_draft
            warehouseid   = max_id
          ) TO mapped-zr_spac107_loc.
   ENDLOOP.
  ENDMETHOD.

ENDCLASS.
