# The name of this view in Looker is "Historical Giveaway"
view: historical_giveaway {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_data.Historical giveaway`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
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
    sql: ${TABLE}.DateTime ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Giveaway Perc" in Explore.

  dimension: giveaway_perc {
    type: number
    sql: ${TABLE}.Giveaway_Perc ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_giveaway_perc {
    type: sum
    sql: ${giveaway_perc} ;;
  }

  measure: average_giveaway_perc {
    type: average
    sql: ${giveaway_perc} ;;
  }

  dimension: target_wt {
    type: number
    sql: ${TABLE}.TargetWt ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
