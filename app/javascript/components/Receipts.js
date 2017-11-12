import React from "react"
import PropTypes from "prop-types"
import Receipt from "./Receipt.js"

class Receipts extends React.Component {
    constructor(args) {
    super(args)
    this.state = {
      receipts: []
    }
  }

  componentDidMount() {
    let receiptsies = this.props.data.map((receipt) => {
      return (
        <Receipt {...receipt} key={receipt.id} />
      )
    })
    this.setState({receipts: receiptsies})
  }

  render () {
    return (
      <div>
        <ul>
          {this.state.receipts}
        </ul>
      </div>
    );
  }
}

export default Receipts
