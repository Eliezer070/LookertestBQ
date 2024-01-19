view: tacatmedicion {
  sql_table_name: `indice_felicidad.tacatmedicion` ;;

  dimension: color_hex {
    type: string
    sql: ${TABLE}.fccolor ;;
  }
  dimension: color {
    type: string
    sql: ${color_hex} ;;
    html: <span style="color:{{ value }};">■</span>  ;;
  }
  dimension: valor {
    type: string
    sql: ${TABLE}.fcvalor ;;
  }
  dimension: status {
    type: yesno
    sql: ${TABLE}.fiestatus ;;
  }
  dimension: id_medicion {
    type: number
    sql: ${TABLE}.fiidmedicion ;;
  }
  dimension: id_medicion_periodo {
    type: number
    sql: ${TABLE}.fimedicion_periodo ;;
  }
  dimension: valor_maximo {
    type: number
    sql: ${TABLE}.fivalormax ;;
  }
  dimension: valor_minimo {
    type: number
    sql: ${TABLE}.fivalormin ;;
  }
  measure: count {
    type: count
  }
}
