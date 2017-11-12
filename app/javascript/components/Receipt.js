import React from "react"
import PropTypes from "prop-types"

class Receipt extends React.Component {
  render () {
    return (
      <li>
        <p className="store-name">Name: {this.props.store}</p>
        <p className="receipt-total">Total: {this.props.total}</p>
      </li>
    )
  }
}

export default Receipt
