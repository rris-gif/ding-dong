

view: total_orders {
  derived_table: {
    explore_source: orders {
      column: count {}
      column: state { field: users.state }
    }
  }
  dimension: count {
    description: ""
    type: number
  }
  dimension: state {
    description: ""
  }
}
