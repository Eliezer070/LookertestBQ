view: tapromedioudn {
  sql_table_name: `indice_felicidad.tapromedioudn` ;;

  dimension: fcudn {
    type: string
    sql: ${TABLE}.fcudn ;;
  }
  dimension: fiidperiodo {
    type: number
    sql: ${TABLE}.fiidperiodo ;;
  }
  dimension: fiidpregunta {
    type: number
    sql: ${TABLE}.fiidpregunta ;;
  }
  dimension: fiidudn {
    type: number
    sql: ${TABLE}.fiidudn ;;
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
