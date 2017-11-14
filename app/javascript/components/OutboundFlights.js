import React from "react"
import PropTypes from "prop-types"
import Flight from "./Flight.js"

class OutboundFlights extends React.Component {
    constructor(args) {
    super(args)
    this.state = {
      outboundFlights: []
    }
  }

  componentDidMount() {
    let flightsies = this.props.data.outboundFlights.map((flight) => {
      return (
        <Flight {...flight} key={flight.id} />
      )
    })
    this.setState({outboundFlights: flightsies})
  }

  render () {
    return (
      <div>
      <h2>Outbound Flights</h2>
        <ul>
          {this.state.outboundFlights}
        </ul>
      </div>
    );
  }
}

export default OutboundFlights
