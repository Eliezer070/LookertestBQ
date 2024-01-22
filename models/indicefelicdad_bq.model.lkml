# include all the views
include: "/views/**/*.view.lkml"


connection: "test_bq"

datagroup: indicefelicdad_bq_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: indicefelicdad_bq_default_datagroup


explore: tacatmedicion {
  label: "Medición"
  view_label: "Medición"
  join: tacatperiodos{
    type: inner
    relationship: many_to_many
    sql_on: ${tacatmedicion.id_medicion_periodo} = ${tacatperiodos.id_medicion_periodo} ;;
  }
}
explore: taempleados{
  label: "Empleados"
  view_label: "Empleados"
  join: tacatperiodos {
    view_label: "Periodos"
    type: inner
    relationship: many_to_many
    sql_on: ${taempleados.id_periodo} = ${tacatperiodos.id_periodo}  ;;
  }

  join: tapromedioequipo_lideres {
    view_label: "Promedio Equipo - Lideres"
    from:  tapromedioequipo
    type: inner
    relationship: many_to_many
    sql_on: ${taempleados.numero_empleado} = ${tapromedioequipo_lideres.numero_empleado} AND ${tapromedioequipo_lideres.id_periodo} = ${taempleados.id_periodo};;
  }
  join: medicion_lideres_prom_general{
    view_label: "Medición Promedio Equipo - Lideres"
    from: tacatmedicion
    type: inner
    relationship: many_to_one
    sql_on: ${medicion_lideres_prom_general.valor_maximo} > ${tapromedioequipo_lideres.promedio_general} AND ${medicion_lideres_prom_general.valor_minimo} <= ${tapromedioequipo_lideres.promedio_general}   ;;
    sql_where: ${medicion_lideres_prom_general.id_medicion_periodo}=${tacatperiodos.id_medicion_periodo} ;;
  }

##  join:  tapromedioequipo{
##    type: left_outer
##    relationship: many_to_many
##    sql_on: ${taempleados.id_periodo} = ${tapromedioequipo.id_periodo } AND ${taempleados.fcnombreempleado} = ${tapromedioequipo.numero_empleado} ;;
##  }
##  join:  tapromlindir{
##    type: left_outer
##    relationship: many_to_many
##    sql_on: ${taempleados.id_periodo} = ${tapromlindir.id_periodo} AND ${taempleados.fcnombreempleado} = ${tapromlindir.numero_empleado} ;;
##  }

##  join:  tapromedioudn{
##    type: left_outer
##    relationship: many_to_many
##    sql_on: ${taempleados.id_periodo} = ${tapromedioudn.id_periodo} AND ${taempleados.id_udn} = ${tapromedioudn.id_udn} ;;
##  }

}

explore: tapromedioequipo {
  label: "Equipos"
  view_label: "Equipos"
  join: tacatpreguntas{
    view_label: "Preguntas"
    type: inner
    relationship: many_to_many
    sql_on: ${tacatpreguntas.id_pregunta} = ${tapromedioequipo.id_pregunta}  ;;
  }

  join: taempleados {
    view_label: "Empleado"
    type: inner
    relationship: many_to_one
    sql_on: ${taempleados.numero_empleado} = ${tapromedioequipo.numero_empleado} AND ${taempleados.id_periodo} = ${tapromedioequipo.id_periodo}  ;;
  }
  join: cat_Periodos {
    view_label: "Periodos"
    from:  tacatperiodos
    type: inner
    relationship: many_to_one
    sql_on: ${cat_Periodos.id_periodo} = ${tapromedioequipo.id_periodo} ;;
  }
  join: tacatrubros{
    view_label: "Rubros"
    type: inner
    relationship: many_to_many
    sql_on: ${tacatpreguntas.id_rubro} = ${tacatrubros.id_rubro} ;;
  }
  join: medicion_prom_general{
    view_label: "Medición Promedio General"
    from: tacatmedicion
    type: inner
    relationship: many_to_one
    sql_on: ${medicion_prom_general.valor_maximo} > ${tapromedioequipo.promedio_general} AND ${medicion_prom_general.valor_minimo} <= ${tapromedioequipo.promedio_general}   ;;
    sql_where: ${medicion_prom_general.id_medicion_periodo}=${cat_Periodos.id_medicion_periodo} ;;
  }
  join: medicion_prom_rubro {
    view_label: "Medición Promedio Rubro"
    from: tacatmedicion
    type: inner
    relationship: many_to_one
    sql_on: ${medicion_prom_rubro.valor_maximo} > ${tapromedioequipo.promedio_general} AND ${medicion_prom_rubro.valor_minimo} <= ${tapromedioequipo.promedio_general}   ;;
    sql_where: ${medicion_prom_rubro.id_medicion_periodo}=${cat_Periodos.id_medicion_periodo} ;;
  }
  join: medicion_prom_pregunta {
    view_label: "Medición Promedio Pregunta"
    from: tacatmedicion
    type: inner
    relationship: many_to_one
    sql_on: ${medicion_prom_pregunta.valor_maximo} > ${tapromedioequipo.promedio_general} AND ${medicion_prom_pregunta.valor_minimo} <= ${tapromedioequipo.promedio_general}   ;;
    sql_where: ${medicion_prom_pregunta.id_medicion_periodo}=${cat_Periodos.id_medicion_periodo} ;;
    }
  join: tdpromedioequipos {
    view_label: "Totales"
    from: tdpromedioequipos
    type: inner
    relationship: many_to_one
    sql_on: ${taempleados.numero_empleado} = ${tdpromedioequipos.fcnumeroempleadojefe} AND ${tapromedioequipo.id_periodo} = ${tdpromedioequipos.fiidperiodo} ;;
  }
  }

#explore: tacatrubros {
#  label: "Rubros"
#}

#explore: tacatpreguntas {
#  label: "Preguntas"
#  view_label: "Preguntas"
#  join: tacatrubros {
#    view_label: "Rubros"
#    type: left_outer
#    relationship: one_to_many
#    sql_on: ${tacatpreguntas.id_rubro} = ${tacatrubros.id_rubro} ;;
#  }
#}

explore: tapromedioudn {
  label: "UDN"
  view_label: "UDN"
  join: tacatpreguntas{
    view_label: "Preguntas"
    type: inner
    relationship: many_to_many
    sql_on: ${tacatpreguntas.id_pregunta} = ${tapromedioudn.id_pregunta}  ;;
  }

  join: taempleados {
    view_label: "Empleados"
    type: inner
    relationship: many_to_one
    sql_on: ${taempleados.id_udn} = ${tapromedioudn.id_udn}  AND ${taempleados.id_periodo} = ${tapromedioudn.id_periodo}  ;;
  }
  join: cat_Periodos {
    view_label: "Periodos"
    from:  tacatperiodos
    type: inner
    relationship: many_to_one
    sql_on: ${cat_Periodos.id_periodo} = ${tapromedioudn.id_periodo} ;;
  }
  join: tacatrubros{
    view_label: "Rubros"
    type: inner
    relationship: many_to_one
    sql_on: ${tacatpreguntas.id_rubro} = ${tacatrubros.id_rubro} ;;
  }
  join: medicion_prom_general{
    view_label: "Medición Promedio General"
    from: tacatmedicion
    type: inner
    relationship: many_to_one
    sql_on: ${medicion_prom_general.valor_maximo} > ${tapromedioudn.promedio_general} AND ${medicion_prom_general.valor_minimo} <= ${tapromedioudn.promedio_general}   ;;
    sql_where: ${medicion_prom_general.id_medicion_periodo}=${cat_Periodos.id_medicion_periodo} ;;
  }
  join: medicion_prom_rubro {
    view_label: "Medición Promedio Rubro"
    from: tacatmedicion
    type: inner
    relationship: many_to_one
    sql_on: ${medicion_prom_rubro.valor_maximo} > ${tapromedioudn.promedio_general} AND ${medicion_prom_rubro.valor_minimo} <= ${tapromedioudn.promedio_general}   ;;
    sql_where: ${medicion_prom_rubro.id_medicion_periodo}=${cat_Periodos.id_medicion_periodo} ;;
  }
  join: medicion_prom_pregunta {
    view_label: "Medición Promedio Pregunta"
    from: tacatmedicion
    type: inner
    relationship: many_to_one
    sql_on: ${medicion_prom_pregunta.valor_maximo} > ${tapromedioudn.promedio_general} AND ${medicion_prom_pregunta.valor_minimo} <= ${tapromedioudn.promedio_general}   ;;
    sql_where: ${medicion_prom_pregunta.id_medicion_periodo}=${cat_Periodos.id_medicion_periodo} ;;
  }
  join: tdpromedioudn
  {
    view_label: "Totales"
    from: tdpromedioudn
    type: inner
    relationship: one_to_many
    sql_on: ${tapromedioudn.id_periodo} = ${tdpromedioudn.fiidperiodo} AND ${tapromedioudn.id_udn} = ${tdpromedioudn.fiidudn}    ;;
  }
}

explore: tapromlindir {
  label: "Linea Directa"
  view_label: "Linea Directa"
  join: tacatpreguntas{
    view_label: "Preguntas"
    type: inner
    relationship: many_to_many
    sql_on: ${tacatpreguntas.id_pregunta} = ${tapromlindir.id_pregunta}  ;;
  }

  join: taempleados {
    view_label: "Empleados"
    type: inner
    relationship: many_to_one
    sql_on: ${taempleados.numero_empleado} = ${tapromlindir.numero_empleado}  AND ${taempleados.id_periodo} = ${tapromlindir.id_periodo}  ;;
  }
  join: cat_Periodos {
    view_label: "Periodos"
    from:  tacatperiodos
    type: inner
    relationship: many_to_one
    sql_on: ${cat_Periodos.id_periodo} = ${tapromlindir.id_periodo} ;;
  }
  join: tacatrubros{
    view_label: "Rubros"
    type: inner
    relationship: many_to_many
    sql_on: ${tacatpreguntas.id_rubro} = ${tacatrubros.id_rubro} ;;
  }
  join: medicion_prom_general{
    view_label: "Medición Promedio General"
    from: tacatmedicion
    type: inner
    relationship: many_to_one
    sql_on: ${medicion_prom_general.valor_maximo} > ${tapromlindir.promedio_general} AND ${medicion_prom_general.valor_minimo} <= ${tapromlindir.promedio_general}   ;;
    sql_where: ${medicion_prom_general.id_medicion_periodo}=${cat_Periodos.id_medicion_periodo} ;;
  }
  join: medicion_prom_rubro {
    view_label: "Medición Promedio Rubro"
    from: tacatmedicion
    type: inner
    relationship: many_to_one
    sql_on: ${medicion_prom_rubro.valor_maximo} > ${tapromlindir.promedio_general} AND ${medicion_prom_rubro.valor_minimo} <= ${tapromlindir.promedio_general}   ;;
    sql_where: ${medicion_prom_rubro.id_medicion_periodo}=${cat_Periodos.id_medicion_periodo} ;;
  }
  join: medicion_prom_pregunta {
    view_label: "Medición Promedio Pregunta"
    from: tacatmedicion
    type: inner
    relationship: many_to_one
    sql_on: ${medicion_prom_pregunta.valor_maximo} > ${tapromlindir.promedio_general} AND ${medicion_prom_pregunta.valor_minimo} <= ${tapromlindir.promedio_general}   ;;
    sql_where: ${medicion_prom_pregunta.id_medicion_periodo}=${cat_Periodos.id_medicion_periodo} ;;
  }
  join: tdpromlindir {
    view_label: "Totales"
    from: tdpromlindir
    type: inner
    relationship: many_to_one
    sql_on: ${taempleados.numero_empleado} = ${tdpromlindir.fcnumeroempleadojefe} AND ${tdpromlindir.fiidperiodo} = ${tdpromlindir.fiidperiodo} ;;
  }

}

explore: tacatperiodos {
  label: "Periodos"
  hidden: yes
}
