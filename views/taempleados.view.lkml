view: taempleados {
  sql_table_name: `indice_felicidad.taempleados` ;;

  dimension: fcnombreempleado {
    type: string
    sql: ${TABLE}.fcnombreempleado ;;
  }
  dimension: fcnombrejefe {
    type: string
    sql: ${TABLE}.fcnombrejefe ;;
  }
  dimension: fcnumeroempleado {
    type: string
    sql: ${TABLE}.fcnumeroempleado ;;
  }
  dimension: fcnumeroempleadojefe {
    type: string
    sql: ${TABLE}.fcnumeroempleadojefe ;;
  }
  dimension: fcudn {
    type: string
    sql: ${TABLE}.fcudn ;;
  }
  dimension: fiidperiodo {
    type: number
    sql: ${TABLE}.fiidperiodo ;;
  }
  dimension: fiidudn {
    type: number
    sql: ${TABLE}.fiidudn ;;
  }
  measure: count {
    type: count
  }
}
