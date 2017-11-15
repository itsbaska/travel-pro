import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Trips from '../components/Trips'


const Trip = props => (
  <div>
  <div className="main-content">
    <div className="trips-list">
    <div className="column-1">
      <h2 className="secondary-title">Trips rganized by {props.currentUser.first_name}</h2>
        <Trips data={props.trips} key={props.trips} />
    </div>
    <div className="column-2">
      <h2 className="secondary-title">Trips {props.currentUser.first_name} is attending</h2>
      <Trips data={props.travelTrips} key={props.travelTrips} />
      </div>
    </div>
  </div>
</div>

)

document.addEventListener('DOMContentLoaded', () => {
  const node2 = document.getElementById('all-trips')
  const data2 = JSON.parse(node2.getAttribute('data'))
  ReactDOM.render(<Trip {...data2}/>, node2)
})
