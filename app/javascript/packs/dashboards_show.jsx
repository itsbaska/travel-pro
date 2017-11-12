import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Trips from '../components/Trips'


const Trip = props => (
  <div>
  <h2>Trips organized by {props.organizer.first_name}</h2>
    <Trips data={props.trips} />
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node2 = document.getElementById('all-trips')
  const data2 = JSON.parse(node2.getAttribute('data'))
  ReactDOM.render(<Trip {...data2}/>, node2)
})
