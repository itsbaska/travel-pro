import React from "react"
import PropTypes from "prop-types"
import Traveller from "./Traveller.js"

class TripInfo extends React.Component {
  constructor(args) {
    super(args)
    this.state = {
      trip: [],
      travellers: []
    }
  }

  componentDidMount() {
    let travelsies = this.props.data.travellers.map((traveller) => {
      return (
        <Traveller {...traveller} key={traveller.id} />
      )
    })
    this.setState({trip: this.props.data.trip, travellers: travelsies})
  }

  render () {
    return (
      <ul>
        <h3>{this.state.trip.name}</h3>
        <p>Location: {this.state.trip.location}</p>
        <h4>Travellers</h4>
        {this.state.travellers}
      </ul>
    );
  }
}

export default TripInfo
