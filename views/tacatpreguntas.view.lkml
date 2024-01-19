view: tacatpreguntas {
  sql_table_name: `indice_felicidad.tacatpreguntas` ;;

  dimension: pregunta {
    type: string
    sql: ${TABLE}.fcpregunta ;;
  }
  dimension: status {
    type: yesno
    sql: ${TABLE}.fiestatus ;;
  }
  dimension: id_pregunta {
    type: number
    sql: ${TABLE}.fiidpregunta ;;
  }
  dimension: id_rubro {
    type: number
    sql: ${TABLE}.fiidrubro ;;
  }

  measure: count {
    type: count
  }
}
