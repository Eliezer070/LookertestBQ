view: tacatperiodos {
  sql_table_name: `indice_felicidad.tacatperiodos` ;;

  dimension: fcdesccorta {
    type: string
    sql: ${TABLE}.fcdesccorta ;;
  }
  dimension: fcdesclarga {
    type: string
    sql: ${TABLE}.fcdesclarga ;;
  }
  dimension: fcrecursos_url {
    type: string
    sql: ${TABLE}.fcrecursos_url ;;
  }
  dimension_group: fdingesta_medicion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.fdingesta_medicion ;;
  }
  dimension: fianio {
    type: number
    sql: ${TABLE}.fianio ;;
  }
  dimension: fiestatus {
    type: yesno
    sql: ${TABLE}.fiestatus ;;
  }
  dimension: fiidperiodo {
    type: number
    sql: ${TABLE}.fiidperiodo ;;
  }
  dimension: fimedicion_periodo {
    type: number
    sql: ${TABLE}.fimedicion_periodo ;;
  }
  measure: count {
    type: count
  }
}
