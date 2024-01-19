
view: tdpromedioudn {
  derived_table: {
    sql: SELECT DISTINCT 'Contestadas' AS columna, ficontestadas AS valor, fiidudn, fiidperiodo
      FROM indice_felicidad.tapromedioudn
      UNION ALL
      SELECT DISTINCT 'No Contestadas' AS columna, (fiasignadas - ficontestadas) AS valor, fiidudn, fiidperiodo
      FROM indice_felicidad.tapromedioudn;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: columna {
    type: string
    sql: ${TABLE}.columna ;;
  }

  dimension: valor {
    label: "dim_valor"
    type: number
    sql: ${TABLE}.valor ;;
  }

  dimension: fiidudn {
    hidden: yes
    type: string
    sql: ${TABLE}.fiidudn ;;
  }

  dimension: fiidperiodo {
    hidden: yes
    type: number
    sql: ${TABLE}.fiidperiodo ;;
  }
  measure: avg_valor  {
    label: "valor"
    type: max
    sql: ${TABLE}.valor ;;
  }
  set: detail {
    fields: [
        columna,
  valor,
  fiidudn,
  fiidperiodo
    ]
  }
}
