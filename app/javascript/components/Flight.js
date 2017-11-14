import React from "react"
import PropTypes from "prop-types"

class Flight extends React.Component {
  render () {
    return (
      <li>
        <h4>{this.props.traveller_name}</h4>
        <p className="airline-name">{this.props.airline}</p>
        <p className="airline-arrival">{this.props.arrival}</p>
        <p className="airline-departure">{this.props.departure}</p>
        <p className="airport-name">{this.props.airport}</p>
      </li>
    )
  }
}

export default Flight
