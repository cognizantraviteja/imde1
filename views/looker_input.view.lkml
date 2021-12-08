# The name of this view in Looker is "Looker Input"
view: looker_input {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_data.LookerInput`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "A" in Explore.

  dimension: a {
    type: number
    sql: ${TABLE}.a ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_a {
    type: sum
    sql: ${a} ;;
  }

  measure: average_a {
    type: average
    sql: ${a} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: createddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.createddate ;;
  }

  dimension: p {
    type: number
    sql: ${TABLE}.p ;;
  }

  dimension: q {
    type: number
    sql: ${TABLE}.q ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
