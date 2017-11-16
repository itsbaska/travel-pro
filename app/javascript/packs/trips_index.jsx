import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'



const Trip = props => (
  <div className="main-content home-page">
    <div className="button-container">
      <a href="/login"><button className="login-button">Login</button></a>
      <a href="/users/sign_upherok"><button className="register-button">Register</button></a>
    </div>
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node2 = document.getElementById('all-trips')
  const data2 = JSON.parse(node2.getAttribute('data'))
  ReactDOM.render(<Trip {...data2}/>, node2)
})
