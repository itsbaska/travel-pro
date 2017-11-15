import React from "react"
import PropTypes from "prop-types"
class Traveller extends React.Component {
render () {
    return (
      <li className="traveller-item">
        <p className="traveller-name">{this.props.full_name}</p>
        <p className="traveller-number">{this.props.phone_number}</p>
      </li>
    )
  }
}

export default Traveller
