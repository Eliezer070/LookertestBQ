view: tacatrubros {
  sql_table_name: `indice_felicidad.tacatrubros` ;;

  dimension: fctexto {
    type: string
    sql: ${TABLE}.fctexto ;;
  }
  dimension: fiestatus {
    type: yesno
    sql: ${TABLE}.fiestatus ;;
  }
  dimension: fiidrubro {
    type: number
    sql: ${TABLE}.fiidrubro ;;
  }
  dimension: fiposicion {
    type: number
    sql: ${TABLE}.fiposicion ;;
  }
  measure: count {
    type: count
  }
}
