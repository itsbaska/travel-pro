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
        <div className="trip-info-text">
          <h3>{this.state.trip.name}</h3>
          <p className="trip-organizer">Trip Organizer: {this.state.trip.organizer_name}</p>
          <p className="trip-text"><i className="fa fa-map-marker" aria-hidden="true"></i>  &emsp;{this.state.trip.location}</p>
          <p className="trip-text">Start Date: {this.state.trip.start_date_formatted}</p>
          <p className="trip-text">End Date: {this.state.trip.end_date_formatted}</p>
          <p className="trip-budget">Budget: ${this.state.trip.budget}</p>
        </div>
        <div className="traveller-list">
          <h4>Travellers</h4>
          <ul>
            {this.state.travellers}
          </ul>
          <div className="trip-info-buttons">
            <a href={"/trips/" + this.state.trip.id + "/outbounds"}><button>All Outbound Trips</button></a>
            <a href={"/trips/" + this.state.trip.id + "/inbounds"}><button>All Inbound Trips</button></a>
          </div>
        </div>
        <Chart chartData={this.state.chartData} location={this.state.trip.location} legendPosition="bottom" />
        <div className="trip-info-buttons-container">
          <div className="trip-info-buttons">
            <a href={"/trips/" + this.state.trip.id + "/travelgroupings/new"}><button>Add Traveller</button></a>
            <a href={"/trips/" + this.state.trip.id + "/receipts/new" }><button className="add-receipt">Add Receipt</button></a>
            <a href={"/trips/" + this.state.trip.id + "/outbounds/new"}><button>Add Outbound Info</button></a>
            <a href={"/trips/" + this.state.trip.id + "/inbounds/new"}><button>Add Inbound Info</button></a>
          </div>
        </div>
      </div>
    );
  }
}

export default TripInfo
