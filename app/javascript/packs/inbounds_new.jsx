import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import NewInbound from '../components/NewInbound'
import NavigationBar from '../components/NavigationBar'


const InboundNew = props => (
  <div>
    <NewInbound data={props.trip} />
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('inbound-new-form')
  const data = JSON.parse(node.getAttribute('data'))
  ReactDOM.render(<InboundNew {...data}/>, node)
})
