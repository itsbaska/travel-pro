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
              'rgba(234,110,52, 0.7)',
              'rgba(0,167,179, 0.7)',
              'rgba(223,240,230, 0.7)',
              'rgba(8,69,123, 0.7)',
              'rgba(105,211,217, 0.7)',
              'rgba(255,192,89, 0.7)',
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
      <div className="trip-info">
      <div className="trip-info-top">
        <div className="trip-info-text">
          <h3 className="trip-info-name">{this.state.trip.name}</h3>
          <p className="trip-organizer">Trip Organizer: {this.state.trip.organizer_name}</p>
          <p className="trip-text"><i className="fa fa-map-marker" aria-hidden="true"></i>  &emsp;{this.state.trip.location}</p>
          <p className="trip-text"><span className="label">Start Date: </span>{this.state.trip.start_date_formatted}</p>
          <p className="trip-text"><span className="label">End Date: </span>{this.state.trip.end_date_formatted}</p>
          <p className="trip-budget">Budget: ${this.state.trip.budget}</p>
          <div className="add-info-buttons">
            <a href={"/trips/" + this.state.trip.id + "/receipts/new" }><button className="add-receipt">Add Receipt</button></a>
          </div>
        </div>

        <div className="traveller-list">
        <h2 className="secondary-title">Travellers</h2>
          <ul>
            {this.state.travellers}
          </ul>
          <div className="trip-info-buttons">
            <a href={"/trips/" + this.state.trip.id + "/outbounds"}><button>All Outbound Trips</button></a>
            <a href={"/trips/" + this.state.trip.id + "/inbounds"}><button>All Inbound Trips</button></a>
          </div>
        </div>
      </div>

        <Chart chartData={this.state.chartData} location={this.state.trip.location} legendPosition="bottom" />

        <div className="add-info-buttons">
            <a href={"/trips/" + this.state.trip.id + "/travelgroupings/new"}><button>Add Traveller</button></a>
            <a href={"/trips/" + this.state.trip.id + "/outbounds/new"}><button>Add Outbound Info</button></a>
            <a href={"/trips/" + this.state.trip.id + "/inbounds/new"}><button>Add Inbound Info</button></a>
        </div>
      </div>
    );
  }
}

export default TripInfo
