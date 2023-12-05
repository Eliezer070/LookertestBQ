
# include all the views
include: "/views/**/*.view.lkml"


connection: "test_bq"

datagroup: indicefelicdad_bq_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: indicefelicdad_bq_default_datagroup


explore: tacatmedicion {
  join: tacatperiodos{
    type: inner
    relationship: many_to_many
    sql_on: ${tacatmedicion.fimedicion_periodo} = ${tacatperiodos.fimedicion_periodo} ;;
  }
}
explore:  taempleados{
  join: tacatperiodos {
    type: inner
    relationship: many_to_many
    sql_on: ${taempleados.fiidperiodo} = ${tacatperiodos.fiidperiodo}  ;;
  }
  join:  tapromedioequipo{
    type: left_outer
    relationship: many_to_many
    sql_on: ${taempleados.fiidperiodo} = ${tapromedioequipo.fiidperiodo} AND ${taempleados.fcnombreempleado} = ${tapromedioequipo.fcnumeroempleadojefe} ;;
  }
  join:  tapromlindir{
    type: left_outer
    relationship: many_to_many
    sql_on: ${taempleados.fiidperiodo} = ${tapromlindir.fiidperiodo} AND ${taempleados.fcnombreempleado} = ${tapromlindir.fcnumeroempleadojefe} ;;
  }

  join:  tapromedioudn{
    type: left_outer
    relationship: many_to_many
    sql_on: ${taempleados.fiidperiodo} = ${tapromedioudn.fiidperiodo} AND ${taempleados.fiidudn} = ${tapromedioudn.fiidudn} ;;
  }
}

explore: tapromedioequipo {}

explore: tacatrubros {}

explore: tacatpreguntas {
  join: tacatrubros {
    type: left_outer
    relationship: one_to_many
    sql_on: ${tacatpreguntas.fiidrubro} = ${tacatrubros.fiidrubro} ;;
  }
}

explore: tapromedioudn {}

explore: tapromlindir {}

explore: tacatperiodos {}
