# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: continuous_data_series {
  hidden: yes

  join: continuous_data_series__meta_kv {
    view_label: "Continuous Data Series: Metakv"
    sql: LEFT JOIN UNNEST(${continuous_data_series.meta_kv}) as continuous_data_series__meta_kv ;;
    relationship: one_to_many
  }

  join: continuous_data_series__payload_kv {
    view_label: "Continuous Data Series: Payloadkv"
    sql: LEFT JOIN UNNEST(${continuous_data_series.payload_kv}) as continuous_data_series__payload_kv ;;
    relationship: one_to_many
  }

  join: continuous_data_series__payload_qualifier_kv {
    view_label: "Continuous Data Series: Payloadqualifierkv"
    sql: LEFT JOIN UNNEST(${continuous_data_series.payload_qualifier_kv}) as continuous_data_series__payload_qualifier_kv ;;
    relationship: one_to_many
  }
}

# The name of this view in Looker is "Continuous Data Series"
view: continuous_data_series {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gbg-imde-uc.sfp_data.ContinuousDataSeries`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cloud Tag Name" in Explore.

  dimension: cloud_tag_name {
    type: string
    sql: ${TABLE}.cloudTagName ;;
  }

  dimension: current_state_json {
    type: string
    sql: ${TABLE}.currentStateJson ;;
  }

  dimension: downtime {
    type: number
    sql: ${TABLE}.downtime ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_downtime {
    type: sum
    sql: ${downtime} ;;
  }

  measure: average_downtime {
    type: average
    sql: ${downtime} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: event_timestamp_end {
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
    sql: ${TABLE}.eventTimestampEnd ;;
  }

  dimension_group: event_timestamp_start {
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
    sql: ${TABLE}.eventTimestampStart ;;
  }

  dimension_group: ingest_timestamp {
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
    sql: ${TABLE}.ingestTimestamp ;;
  }

  dimension: meta_json {
    type: string
    sql: ${TABLE}.metaJson ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: meta_kv {
    hidden: yes
    sql: ${TABLE}.metaKV ;;
  }

  dimension: payload_json {
    type: string
    sql: ${TABLE}.payloadJson ;;
  }

  dimension: payload_kv {
    hidden: yes
    sql: ${TABLE}.payloadKV ;;
  }

  dimension: payload_qualifier_json {
    type: string
    sql: ${TABLE}.payloadQualifierJson ;;
  }

  dimension: payload_qualifier_kv {
    hidden: yes
    sql: ${TABLE}.payloadQualifierKV ;;
  }

  dimension: previous_state_json {
    type: string
    sql: ${TABLE}.previousStateJson ;;
  }

  dimension: tag_definition {
    type: string
    sql: ${TABLE}.tagDefinition ;;
  }

  dimension: tag_name {
    type: string
    sql: ${TABLE}.tagName ;;
  }

  dimension: uptime {
    type: number
    sql: ${TABLE}.uptime ;;
  }

  measure: count {
    type: count
    drill_fields: [tag_name, cloud_tag_name]
  }
}

# The name of this view in Looker is "Continuous Data Series Meta Kv"
view: continuous_data_series__meta_kv {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: continuous_data_series__meta_kv {
    type: string
    hidden: yes
    sql: continuous_data_series__meta_kv ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Continuous Data Series Payload Kv"
view: continuous_data_series__payload_kv {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: continuous_data_series__payload_kv {
    type: string
    hidden: yes
    sql: continuous_data_series__payload_kv ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Continuous Data Series Payload Qualifier Kv"
view: continuous_data_series__payload_qualifier_kv {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: continuous_data_series__payload_qualifier_kv {
    type: string
    hidden: yes
    sql: continuous_data_series__payload_qualifier_kv ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}
