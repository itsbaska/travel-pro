import React from "react"
import PropTypes from "prop-types"
import {Pie} from 'react-chartjs-2'

class Chart extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      chartData: props.chartData
    }
  }

  static defaultProps = {
    displayTitle: true,
    displayLegend: true,
    legendPosition: 'right',
    location: 'City'
  }


  render () {
    return (
      <div className="chart">
        <Pie
          data={this.state.chartData}
          options={{
            title:{
              display: this.props.displayTitle,
              text: "Trip in " + this.props.location,
              fontSize: 50
            },
            legend:{
              display: this.props.displayLegend,
              position: this.props.legendPosition
            }
          }}
          />
      </div>
    )
  }
}

export default Chart
