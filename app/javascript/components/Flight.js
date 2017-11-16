import React from "react"
import PropTypes from "prop-types"

class Flight extends React.Component {
  render () {
    return (
      <li className="trip-flights">
        <h4>{this.props.traveller_name}</h4>
        <p className="airline-arrival">{this.props.arrival_formatted}</p>
        <p className="airline-departure">{this.props.departure_formatted}</p>
        <p className="airline-name">{this.props.airline}</p>
        <p className="airport-name">{this.props.airport}</p>
      </li>
    )
  }
}

export default Flight
