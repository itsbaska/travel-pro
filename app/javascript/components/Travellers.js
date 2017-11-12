import React from "react"
import PropTypes from "prop-types"
import Traveller from "./Traveller.js"

class Travellers extends React.Component {
  constructor(args) {
    super(args)
    this.state = {
      travellers: []
    }
  }

  componentDidMount() {
    let travelsies = this.props.data.map((traveller) => {
      return (
        <Traveller {...traveller} key={traveller.id} />
      )
    })
    this.setState({travellers: travelsies})
  }

  render () {
    return (
      <ul>
        {this.state.travellers}
      </ul>
    );
  }
}

export default Travellers
