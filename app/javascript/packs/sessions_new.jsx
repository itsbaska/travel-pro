import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import HelloWorld from '../components/HelloWorld'

import Login from '../components/Login'

const SignIn = props => (
  <div> <Login/> </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('login-form')
  ReactDOM.render(<SignIn/>, node)
})
