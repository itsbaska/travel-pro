import React from "react"
import PropTypes from "prop-types"
import Trip from "./Trip"

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
    if (this.state.trips.length === 0) {
      return (
        <div>
          <ul>
            <li>You have not created any trips yet!</li>
          </ul>
        </div>
      );
    } else {
      return (
        <div>
          <ul>
            {this.state.trips}
          </ul>
        </div>
      );
    }
  }
}

export default Trips
