import React from "react"
import PropTypes from "prop-types"

class Flight extends React.Component {
  render () {
    return (
      <li>
        <p className="trip-name">Name: <a href={"/trips/"+ this.props.id}>{this.props.airline}</a></p>
      </li>
    )
  }
}

export default Flight
