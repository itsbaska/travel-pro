import React from "react"
import PropTypes from "prop-types"
class Trip extends React.Component {
  render () {
    return (
      <li>
        <p className="trip-name">Name: {this.props.name}</p>
        <p className="trip-location">Location: {this.props.location}</p>
      </li>
    )
  }
}

export default Trip
