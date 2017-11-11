import React from "react"
import PropTypes from "prop-types"
import Trip from "./Trip.js"

class Trips extends React.Component {
    constructor(args) {
    super(args)
    this.state = {
      trips: []
    }
  }

  componentDidMount() {
    let tripsies = this.props.data.map((trip) => {
      return (
        <Trip {...trip} key={trip.id} />
      )
    })
    this.setState({trips: tripsies})
  }

  render () {
    return (
      <ul>
        {this.state.trips}
      </ul>
    );
  }
}

export default Trips
