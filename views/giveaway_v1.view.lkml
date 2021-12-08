# The name of this view in Looker is "Giveaway V1"
view: giveaway_v1 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_data.Giveaway_V1`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Batch Code" in Explore.

  dimension: batch_code {
    type: number
    sql: ${TABLE}.BatchCode ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_batch_code {
    type: sum
    sql: ${batch_code} ;;
  }

  measure: average_batch_code {
    type: average
    sql: ${batch_code} ;;
  }

  dimension: give_away_savings {
    type: number
    sql: ${TABLE}.GiveAway_Savings ;;
  }

  dimension: historical__giveaway__ {
    type: number
    sql: ${TABLE}.Historical__Giveaway__ ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.Product ;;
  }

  dimension: revised_giveaway {
    type: number
    sql: ${TABLE}.Revised_giveaway ;;
  }

  dimension: samples_count {
    type: number
    sql: ${TABLE}.Samples_count ;;
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
