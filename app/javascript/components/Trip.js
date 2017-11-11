import React from "react"
import PropTypes from "prop-types"

class Trip extends React.Component {
  render () {
    return (
      <li>
        {console.log(this.props.id)}
        <a href={"/trips/"+ this.props.id}><p className="trip-name">Name: {this.props.name}</p></a>
        <p className="trip-location">Location: {this.props.location}</p>
      </li>
    )
  }
}

export default Trip
