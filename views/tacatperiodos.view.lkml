view: tacatperiodos {
  sql_table_name: `indice_felicidad.tacatperiodos` ;;

  dimension: descripcion_corta {
    type: string
    sql: ${TABLE}.fcdesccorta ;;
  }
  dimension: descripcion {
    type: string
    sql: ${TABLE}.fcdesclarga ;;
  }
  dimension: url_recursos {
    type: string
    sql: ${TABLE}.fcrecursos_url ;;
  }
  dimension_group: ingesta_medicion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.fdingesta_medicion ;;
  }
  dimension: anio {
    type: number
    sql: ${TABLE}.fianio ;;
  }
  dimension: status {
    type: yesno
    sql: ${TABLE}.fiestatus ;;
  }
  dimension: id_periodo {
    type: number
    sql: ${TABLE}.fiidperiodo ;;
  }
  dimension: id_medicion_periodo {
    type: number
    sql: ${TABLE}.fimedicion_periodo ;;
  }
  dimension: periodo_str {
    type: string
    sql: ${anio}||' '||${descripcion_corta} ;;
  }
  measure: count {
    type: count
  }
}
