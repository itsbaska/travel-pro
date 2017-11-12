import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import NavigationBar from '../components/NavigationBar'

const Navigation = props => (
  <div>
    <NavigationBar data={props}/>
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('navigation-bar')
  const data = JSON.parse(node.getAttribute('data'))
  ReactDOM.render(<Navigation {...data}/>, node)
})
