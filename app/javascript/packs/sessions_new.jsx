import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Login from '../components/Login'
import NavigationBar from '../components/NavigationBar'


const SignIn = props => (
  <div> <Login/> </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('login-form')
  ReactDOM.render(<SignIn/>, node)
})
