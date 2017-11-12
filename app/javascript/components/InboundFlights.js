import React from "react"
import PropTypes from "prop-types"
import Flight from "./Flight.js"

class InboundFlights extends React.Component {
    constructor(args) {
    super(args)
    this.state = {
      inboundFlights: []
    }
  }

  componentDidMount() {
    console.log(this.props.data)
    let flightsies = this.props.data.inboundFlights.map((flight) => {
      return (
        <Flight {...flight} key={flight.id} />
      )
    })
    this.setState({inboundFlights: flightsies})
    console.log(this.state.inboundFlights)
  }

  render () {
    return (
      <div>
      <h2>Inbound Flights</h2>
        <ul>
          {this.state.inboundFlights}
        </ul>
      </div>
    );
  }
}

export default InboundFlights
