import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import NewOutbound from '../components/NewOutbound'
import NavigationBar from '../components/NavigationBar'


const OutboundNew = props => (
  <div>
    <NewOutbound data={props.trip} />
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('outbound-new-form')
  const data = JSON.parse(node.getAttribute('data'))
  ReactDOM.render(<OutboundNew {...data}/>, node)
})
