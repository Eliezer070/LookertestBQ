
view: tdpromedioequipos {
  derived_table: {
    sql: SELECT DISTINCT 'Contestadas' AS Columna, ficontestadas AS Valor, fcnumeroempleadojefe, fiidperiodo
      FROM indice_felicidad.tapromedioequipo
      UNION ALL
      SELECT DISTINCT 'No Contestadas' AS Columna, (fiasignadas - ficontestadas) AS Valor, fcnumeroempleadojefe, fiidperiodo
      FROM indice_felicidad.tapromedioequipo ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
    }

  dimension: columna {
    type: string
    sql: ${TABLE}.Columna ;;
  }

  dimension: valor_n {
    type: number
    sql: ${TABLE}.Valor ;;
  }

  measure: avg_valor {
    label: "valor"
    type: max
    sql: ${TABLE}.Valor ;;
  }

  dimension: fcnumeroempleadojefe {
    type: string
    sql: ${TABLE}.fcnumeroempleadojefe ;;
    hidden: yes
  }

  dimension: fiidperiodo {
    type: number
    sql: ${TABLE}.fiidperiodo ;;
    hidden: yes
  }

  set: detail {
    fields: [
        columna,
  valor_n,
  fcnumeroempleadojefe,
  fiidperiodo
    ]
  }
}
