import React from "react"
import PropTypes from "prop-types"

class Trip extends React.Component {
  render () {
    return (
      <li className="trip-item">
        <h3 className="trip-name"><a href={"/trips/"+ this.props.id}>{this.props.name}</a></h3>
        <p className="trip-location"><i className="fa fa-map-marker" aria-hidden="true"></i>  &ensp;{this.props.location}</p>
        <p className="trip-start-date"><span className="label">Start date:&ensp;</span>{this.props.start_date_formatted}</p>
        <p className="trip-end-date"><span className="label">End date:&ensp;</span>{this.props.end_date_formatted}</p>
      </li>
    )
  }
}

export default Trip
