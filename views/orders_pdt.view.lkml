view: orders_pdt {
  # Define this view as a Native Derived Table
  derived_table: {
    # Specify the source explore for this NDT
    explore_source: orders {
      # List the columns you want to include in your PDT
      column: id {
        field: orders.id
      }
      column: created_date {
        field: orders.created_date
      }
      column: status {
        field: orders.status
      }
      column: user_id {
        field: orders.user_id
      }
      # You can add more columns from the orders explore here
    }

    # Apply the datagroup persistence strategy from the model file
    datagroup_trigger: orders_count_trigger

    # Add the requested indexes for faster querying
    indexes: ["id", "created_date"]
  }

  # Define dimensions based on the columns from the explore_source
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }
}
