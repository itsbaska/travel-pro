import React from "react"
import PropTypes from "prop-types"
class Traveller extends React.Component {
render () {
    return (
      <li>
        <p className="trip-name">{this.props.first_name}</p>
      </li>
    )
  }
}

export default Traveller