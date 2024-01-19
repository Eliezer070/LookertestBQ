view: taempleados {
  sql_table_name: `indice_felicidad.taempleados` ;;

  dimension: nombre_empleado {
    type: string
    sql: ${TABLE}.fcnombreempleado ;;
  }
  dimension: nombre_jefe {
    type: string
    sql: ${TABLE}.fcnombrejefe ;;
  }
  dimension: numero_empleado {
    type: string
    sql: ${TABLE}.fcnumeroempleado ;;
  }
  dimension: numero_empleado_jefe {
    type: string
    sql: ${TABLE}.fcnumeroempleadojefe ;;
  }
  dimension: nombre_udn {
    type: string
    sql: ${TABLE}.fcudn ;;
  }
  dimension: id_periodo {
    type: number
    sql: ${TABLE}.fiidperiodo ;;
  }
  dimension: id_udn {
    type: number
    sql: ${TABLE}.fiidudn ;;
  }
  dimension:numero_con_nombre_empleado  {
    type: string
    sql:   LPAD(${numero_empleado} , 8, '0')  || ' - ' || ${nombre_empleado}  ;;
  }
  dimension:numero_con_nombre_jefe  {
    type: string
    sql:   LPAD(${numero_empleado_jefe} , 8, '0')  || ' - ' || ${nombre_jefe}  ;;
  }
  measure: count {
    type: count
  }
}
