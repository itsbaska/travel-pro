import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import TripInfo from '../components/TripInfo'



const Trip = props => (
  <div>
    <TripInfo data={props}/>
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('trip-info')
  const data = JSON.parse(node.getAttribute('data'))
  ReactDOM.render(<Trip {...data}/>, node)
})
