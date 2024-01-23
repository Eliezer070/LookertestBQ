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
    sql:${TABLE}.fiasignadas ;;
  }
  dimension: contestadas {
    type:  number
    sql:   ${TABLE}.ficontestadas ;;
  }
  measure: count {
    type: count
  }
  measure: promedio_rubro {
    type: max
    sql: ${TABLE}.fipromediorubro ;;
  }
  measure: promedio_general {
    type: max
    sql: ${TABLE}.fipromediogeneral ;;
  }
  measure: promedio_pregunta {
    type: max
    sql: ${TABLE}.fipromediorespuesta ;;
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
