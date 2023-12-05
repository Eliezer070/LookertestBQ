view: tacatpreguntas {
  sql_table_name: `indice_felicidad.tacatpreguntas` ;;

  dimension: fcpregunta {
    type: string
    sql: ${TABLE}.fcpregunta ;;
  }
  dimension: fiestatus {
    type: yesno
    sql: ${TABLE}.fiestatus ;;
  }
  dimension: fiidpregunta {
    type: number
    sql: ${TABLE}.fiidpregunta ;;
  }
  dimension: fiidrubro {
    type: number
    sql: ${TABLE}.fiidrubro ;;
  }
  measure: count {
    type: count
  }
}
