import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Register from '../components/Register'
import NavigationBar from '../components/NavigationBar'


const SignUp = props => (
  <div>
    <Register/>
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('register-form')
  ReactDOM.render(<SignUp/>, node)
})
