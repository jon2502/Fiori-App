CLASS zcl_spac107_product_loader DEFINITION
PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_product_table
        RETURNING VALUE(r_output) TYPE string
        RAISING cx_sy_open_sql_db,
      cleanup
        RETURNING VALUE(r_output) TYPE STRING.

ENDCLASS.


CLASS zcl_spac107_product_loader IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    out->write( cleanup(  ) ).

    TRY.
      out->write( fill_product_table(  ) ).
    CATCH cx_sy_open_sql_db INTO DATA(lx).
      out->write( |Couldn't write entries to table. Error: { lx->get_longtext(  ) }| ).
    ENDTRY.

  ENDMETHOD.


  METHOD fill_product_table.

    DATA: temp_table TYPE TABLE OF  zspac107_product,
          result_table TYPE TABLE OF zspac107_product.
    .
    temp_table = VALUE #(
      ( product_id = 1 product_name = 'Intercessor Squad' product_desctiption = 'Intercessors are tough, flexible, highly skilled, and capable of laying down withering hails of fire. Bolt rifles booming' price = 410 )
      ( product_id = 2 product_name = 'Assault Intercessors with Jump Packs'  product_desctiption = 'Assault Intercessors with Jump Packs soar over the battlefield, slamming into the foe like a hammer from the skies.' price = 390 )
      ( product_id = 3 product_name = 'Brutalis Dreadnought'  product_desctiption = 'The Brutalis Dreadnought is a line breaker and a terror weapon – a bipedal combat walker armed for close combat and piloted by a fallen hero of its Chapter' price = 540 )
      ( product_id = 4 product_name = 'Captain on Bike'  product_desctiption = 'Some Space Marine Captains ride to war on Raider-pattern bikes. This is common among the White Scars and Blood Angels,'
      && 'who prize speed and swift armoured strikes most highly.' price = 365 )
      ( product_id = 5 product_name = 'Kill Team: Deathwatch'  product_desctiption = 'The Deathwatch are a Space Marine Chapter unlike any other – tasked with ruthlessly hunting down and destroying the xenos menace at the bidding of the Inquisition'
      price = 435 )
    ).

    TRY.
      INSERT  zspac107_product  FROM TABLE @( CORRESPONDING #( temp_table ) ).
    CATCH cx_sy_open_sql_db INTO DATA(lx).
      RAISE EXCEPTION lx.
    ENDTRY.

    r_output = |Inserted { sy-dbcnt } entries into table.|.
  ENDMETHOD.

  METHOD cleanup.
    DELETE FROM  zspac107_product .

    IF sy-subrc <> 0.
      ROLLBACK WORK.
      r_output = |Cleanup failed. Error: { sy-subrc }.|.
    ELSE.
      COMMIT WORK.
      r_output = |Successfully cleaned up { sy-dbcnt } entries.|.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
