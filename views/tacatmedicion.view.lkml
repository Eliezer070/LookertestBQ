view: tacatmedicion {
  sql_table_name: `indice_felicidad.tacatmedicion` ;;

  dimension: fccolor {
    type: string
    sql: ${TABLE}.fccolor ;;
  }
  dimension: fcvalor {
    type: string
    sql: ${TABLE}.fcvalor ;;
  }
  dimension: fiestatus {
    type: yesno
    sql: ${TABLE}.fiestatus ;;
  }
  dimension: fiidmedicion {
    type: number
    sql: ${TABLE}.fiidmedicion ;;
  }
  dimension: fimedicion_periodo {
    type: number
    sql: ${TABLE}.fimedicion_periodo ;;
  }
  dimension: fivalormax {
    type: number
    sql: ${TABLE}.fivalormax ;;
  }
  dimension: fivalormin {
    type: number
    sql: ${TABLE}.fivalormin ;;
  }
  measure: count {
    type: count
  }
}
