import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import OutboundFlights from '../components/OutboundFlights.js'


const Flights = props => (
  <div>
    <OutboundFlights data={props}/>
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('outbound-flights-container')
  const data = JSON.parse(node.getAttribute('data'))
  ReactDOM.render(<Flights {...data}/>, node)

})
