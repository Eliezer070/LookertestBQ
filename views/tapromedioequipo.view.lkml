view: tapromedioequipo {
  sql_table_name: `indice_felicidad.tapromedioequipo` ;;

  dimension: nombre {
    type: string
    sql: ${TABLE}.fcnombrejefe ;;
  }
  dimension: numero_empleado {
    type: string
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
    sql:${TABLE}.fiasignadas ;;
  }
  dimension: contestadas {
    type:  number
    sql:   ${TABLE}.ficontestadas ;;
  }
  measure: count {
    type: count
  }
  measure: relacion_asignadas_contestadas {
    type: number
    sql: ${asignadas} / NULLIF((${contestadas}), 0) ;;
    value_format_name: decimal_0
  }

  measure: porcentaje_contestadas {
    type: number
    sql: ${contestadas} / NULLIF((${asignadas}), 0) ;;
    value_format_name: decimal_0
  }

  measure: porcentaje_no_contestadas {
    type: number
    sql: 1 - ${porcentaje_contestadas} ;;
    value_format_name: decimal_0
  }

}
