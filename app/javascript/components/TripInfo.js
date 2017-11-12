import React from "react"
import PropTypes from "prop-types"
import Traveller from "./Traveller.js"

class TripInfo extends React.Component {
  constructor(args) {
    super(args)
    this.state = {
      trip: [],
      travellers: []
    }
  }

  componentDidMount() {
    let travelsies = this.props.data.travellers.map((traveller) => {
      return (
        <Traveller {...traveller} key={traveller.id} />
      )
    })
    this.setState({trip: this.props.data.trip, travellers: travelsies})
  }

  render () {
    return (
      <div>
      <ul>
        <h3>{this.state.trip.name}</h3>
        <p>Location: {this.state.trip.location}</p>
        <h4>Travellers</h4>
          {this.state.travellers}
        <a href={"/trips/" + this.state.trip.id + "/receipts/new" }><button>Add Receipt</button></a>
      </ul>

      <a href={"/trips/" + this.state.trip.id + "/outbounds/new"}><button>Add Outbound Info</button></a>
      <a href={"/trips/" + this.state.trip.id + "/inbounds/new"}><button>Add Inbound Info</button></a>

      <a href={"/trips/" + this.state.trip.id + "/outbounds"}><button>All Outbound Trips</button></a>
      <a href={"/trips/" + this.state.trip.id + "/inbounds"}><button>All Inbound Trips</button></a>


      </div>
    );
  }
}

export default TripInfo
