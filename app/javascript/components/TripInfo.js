import React from "react"
import PropTypes from "prop-types"
import Traveller from "./Traveller.js"

import Chart from './Chart.js'

class TripInfo extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      trip: [],
      travellers: [],
      chartData: {}
    }
  }

  componentWillMount() {
    this.getChartData()
  }

  getChartData() {
    this.setState({
      chartData:{
        labels: this.props.data.purchasers,

        datasets:[
          {
            label: "Total",

            data: this.props.data.amount,
            backgroundColor: [
              'rgba(255, 99, 132, 0.6)',
              'rgba(54, 162, 235, 0.6)',
              'rgba(255, 200, 100, 0.6)',
            ]
          }
        ]
      }
    })
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

          <Chart chartData={this.state.chartData} location={this.state.trip.location} legendPosition="bottom" />

        <a href={"/trips/" + this.state.trip.id + "/receipts/new" }><button>Add Receipt</button></a>
      </ul>

      <a href={"/trips/" + this.state.trip.id + "/outbounds/new"}><button>Add Outbound Info</button></a>
      <a href={"/trips/" + this.state.trip.id + "/inbounds/new"}><button>Add Inbound Info</button></a>

      <a href={"/trips/" + this.state.trip.id + "/outbounds"}><button>All Outbound Trips</button></a>
      <a href={"/trips/" + this.state.trip.id + "/inbounds"}><button>All Inbound Trips</button></a>
      <a href={"/trips/" + this.state.trip.id + "/travelgroupings/new"}><button>Add Traveller</button></a>
      </div>
    );
  }
}

export default TripInfo
