CLASS zcl_spac107_warehouse_loader DEFINITION
    PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_loc_table
        RETURNING VALUE(r_output) TYPE string
        RAISING cx_sy_open_sql_db,
      cleanup
        RETURNING VALUE(r_output) TYPE STRING.

ENDCLASS.


CLASS zcl_spac107_warehouse_loader IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    out->write( cleanup(  ) ).

    TRY.
      out->write( fill_loc_table(  ) ).
    CATCH cx_sy_open_sql_db INTO DATA(lx).
      out->write( |Couldn't write entries to table. Error: { lx->get_longtext(  ) }| ).
    ENDTRY.

  ENDMETHOD.


  METHOD fill_loc_table.

    DATA: temp_table TYPE TABLE OF  zspac107_loc .


    temp_table = VALUE #(
      ( warehouse_id = 1 address = 'Esbjerg' post_code = 6701 )
      ( warehouse_id = 2 address = 'Ballerup' post_code = 2750 )
      ( warehouse_id = 3 address = 'Kolding' post_code = 6000 )
    ).

    TRY.
      INSERT  zspac107_loc  FROM TABLE @( CORRESPONDING #( temp_table ) ).

    CATCH cx_sy_open_sql_db INTO DATA(lx).
      RAISE EXCEPTION lx.
    ENDTRY.

    r_output = |Inserted { sy-dbcnt } entries into table.|.
  ENDMETHOD.

  METHOD cleanup.
    DELETE FROM  zspac107_loc .

    IF sy-subrc <> 0.
      ROLLBACK WORK.
      r_output = |Cleanup failed. Error: { sy-subrc }.|.
    ELSE.
      COMMIT WORK.
      r_output = |Successfully cleaned up { sy-dbcnt } entries.|.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
