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
  measure: count {
    type: count
  }
}
