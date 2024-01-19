view: tapromlindir {
  sql_table_name: `indice_felicidad.tapromlindir` ;;

  dimension: nombre {
    type: string
    sql: ${TABLE}.fcnombrejefe ;;
  }
  dimension: numero_empleado {
    type: number
    sql: ${TABLE}.fcnumeroempleadojefe ;;
  }
  dimension: id_periodo {
    type: number
    sql: ${TABLE}.fiidperiodo ;;
  }
  dimension: id_pregunta {
    type: number
    sql: ${TABLE}.fiidpregunta ;;
  }
  dimension: promedio_general {
    type: number
    sql: ${TABLE}.fipromediogeneral ;;
  }
  dimension: promedio_pregunta {
    type: number
    sql: ${TABLE}.fipromediorespuesta ;;
  }
  dimension: promedio_rubro {
    type: number
    sql: ${TABLE}.fipromediorubro ;;
  }
  dimension: asignadas {
    type:  number
    sql: ${TABLE}.fiasignadas ;;
  }
  dimension: contestadas {
    type:  number
    sql: ${TABLE}.ficontestadas ;;
}
  measure: count {
    type: count
  }
}
