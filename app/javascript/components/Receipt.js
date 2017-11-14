import React from "react"
import PropTypes from "prop-types"

class Receipt extends React.Component {
  render () {
    return (
      <li>
        <p className="store-name">Name: {this.props.store}</p>
        <p>Purchased by: {this.props.purchaser_name}</p>
        <p className="receipt-total">Total: ${this.props.total}</p>
        <img src={"https:"+this.props.photo_url}/>
      </li>
    )
  }
}

export default Receipt
