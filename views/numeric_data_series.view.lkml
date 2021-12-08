# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: numeric_data_series {
  hidden: yes

  join: numeric_data_series__meta_kv {
    view_label: "Numeric Data Series: Metakv"
    sql: LEFT JOIN UNNEST(${numeric_data_series.meta_kv}) as numeric_data_series__meta_kv ;;
    relationship: one_to_many
  }

  join: numeric_data_series__payload_kv {
    view_label: "Numeric Data Series: Payloadkv"
    sql: LEFT JOIN UNNEST(${numeric_data_series.payload_kv}) as numeric_data_series__payload_kv ;;
    relationship: one_to_many
  }

  join: numeric_data_series__payload_qualifier_kv {
    view_label: "Numeric Data Series: Payloadqualifierkv"
    sql: LEFT JOIN UNNEST(${numeric_data_series.payload_qualifier_kv}) as numeric_data_series__payload_qualifier_kv ;;
    relationship: one_to_many
  }
}

# The name of this view in Looker is "Numeric Data Series"
view: numeric_data_series {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gbg-imde-uc.sfp_data.NumericDataSeries`
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

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: event_timestamp {
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
    sql: ${TABLE}.eventTimestamp ;;
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

  dimension: tag_definition {
    type: string
    sql: ${TABLE}.tagDefinition ;;
  }

  dimension: tag_name {
    type: string
    sql: ${TABLE}.tagName ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [cloud_tag_name, tag_name]
  }
}

# The name of this view in Looker is "Numeric Data Series Meta Kv"
view: numeric_data_series__meta_kv {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: numeric_data_series__meta_kv {
    type: string
    hidden: yes
    sql: numeric_data_series__meta_kv ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Numeric Data Series Payload Kv"
view: numeric_data_series__payload_kv {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: numeric_data_series__payload_kv {
    type: string
    hidden: yes
    sql: numeric_data_series__payload_kv ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Numeric Data Series Payload Qualifier Kv"
view: numeric_data_series__payload_qualifier_kv {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: numeric_data_series__payload_qualifier_kv {
    type: string
    hidden: yes
    sql: numeric_data_series__payload_qualifier_kv ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}
