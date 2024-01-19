view: tacatrubros {
  sql_table_name: `indice_felicidad.tacatrubros` ;;

  dimension: rubro {
    type: string
    sql: ${TABLE}.fctexto ;;
  }
  dimension: status {
    type: yesno
    sql: ${TABLE}.fiestatus ;;
  }
  dimension: id_rubro {
    type: number
    sql: ${TABLE}.fiidrubro ;;
  }
  dimension: posision {
    type: number
    sql: ${TABLE}.fiposicion ;;
  }
  measure: count {
    type: count
  }
}
