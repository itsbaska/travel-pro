import React from "react"
import PropTypes from "prop-types"

class Flight extends React.Component {
  render () {
    console.log(this.props)
    return (
      <li>
        <h4 className="airline-name">{this.props.airline}</h4>
        <p className="airline-arrival">{this.props.arrival}</p>
        <p className="airline-departure">{this.props.departure}</p>
        <p className="airport-name">{this.props.airport}</p>
      </li>
    )
  }
}

export default Flight
