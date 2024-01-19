view: tapromedioudn {
  sql_table_name: `indice_felicidad.tapromedioudn` ;;

  dimension: nombre_udn{
    type: string
    sql: ${TABLE}.fcudn ;;
  }
  dimension: id_periodo {
    type: number
    sql: ${TABLE}.fiidperiodo ;;
  }
  dimension: id_pregunta {
    type: number
    sql: ${TABLE}.fiidpregunta ;;
  }
  dimension: id_udn {
    type: number
    sql: ${TABLE}.fiidudn ;;
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
