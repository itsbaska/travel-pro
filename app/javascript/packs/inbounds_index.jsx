import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import InboundFlights from '../components/InboundFlights.js'


const Flights = props => (
  <div>
    <InboundFlights data={props}/>
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('inbound-flights-container')
  const data = JSON.parse(node.getAttribute('data'))
  ReactDOM.render(<Flights {...data}/>, node)

})
