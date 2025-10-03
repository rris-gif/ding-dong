# If necessary, uncomment the line below to include explore_source.
# include: "rishi_training12.model.lkml"

view: derived_new {
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
