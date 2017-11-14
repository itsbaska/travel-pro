import React from "react"
import PropTypes from "prop-types"

class Trip extends React.Component {
  render () {
    return (
      <li>
        <h3 className="trip-name">Name: <a href={"/trips/"+ this.props.id}>{this.props.name}</a></h3>
        <p className="trip-location">Location: {this.props.location}</p>
        <p className="trip-start-date">Start date: {this.props.start_date_formatted}</p>
        <p className="trip-end-date">End date: {this.props.end_date_formatted}</p>
      </li>
    )
  }
}

export default Trip
