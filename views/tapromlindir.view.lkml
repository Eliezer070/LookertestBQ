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
  dimension: promedio_general_h {
    hidden: yes
    type: number
    sql: ${TABLE}.fipromediogeneral ;;
  }
  dimension: promedio_pregunta_h {
    hidden: yes
    type: number
    sql: ${TABLE}.fipromediorespuesta ;;
  }
  dimension: promedio_rubro_h {
    hidden: yes
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
  measure: promedio_rubro {
    type: max
    sql: ${TABLE}.fipromediorubro ;;
    value_format: "0.00"
  }
  measure: promedio_general {
    type: max
    sql: ${TABLE}.fipromediogeneral ;;
    value_format: "0.00"
  }
  measure: promedio_pregunta {
    type: max
    sql: ${TABLE}.fipromediorespuesta ;;
    value_format: "0.00"
  }
}
