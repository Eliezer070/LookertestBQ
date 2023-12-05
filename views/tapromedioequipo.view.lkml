view: tapromedioequipo {
  sql_table_name: `indice_felicidad.tapromedioequipo` ;;

  dimension: fcnombrejefe {
    type: string
    sql: ${TABLE}.fcnombrejefe ;;
  }
  dimension: fcnumeroempleadojefe {
    type: number
    sql: ${TABLE}.fcnumeroempleadojefe ;;
  }
  dimension: fiidperiodo {
    type: number
    sql: ${TABLE}.fiidperiodo ;;
  }
  dimension: fiidpregunta {
    type: number
    sql: ${TABLE}.fiidpregunta ;;
  }
  dimension: fipromediogeneral {
    type: number
    sql: ${TABLE}.fipromediogeneral ;;
  }
  dimension: fipromediorespuesta {
    type: number
    sql: ${TABLE}.fipromediorespuesta ;;
  }
  dimension: fipromediorubro {
    type: number
    sql: ${TABLE}.fipromediorubro ;;
  }
  measure: count {
    type: count
  }
}
