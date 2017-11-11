import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import NewInbound from '../components/NewInbound'
import NavigationBar from '../components/NavigationBar'


const InboundNew = props => (
  <div>
    <NewInbound/>
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('inbound-new-form')
  ReactDOM.render(<InboundNew/>, node)
})
