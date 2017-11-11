import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import NavigationBar from '../components/NavigationBar'

const Navigation = props => (
  <div>
    <NavigationBar/>
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('navigation-bar')
  ReactDOM.render(<Navigation/>, node)
})
