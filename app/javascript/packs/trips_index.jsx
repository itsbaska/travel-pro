import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'



const Trip = props => (
  <div>
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node2 = document.getElementById('all-trips')
  const data2 = JSON.parse(node2.getAttribute('data'))
  ReactDOM.render(<Trip {...data2}/>, node2)

})
