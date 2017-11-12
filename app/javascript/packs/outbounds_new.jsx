import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import NewOutbound from '../components/NewOutbound'
import NavigationBar from '../components/NavigationBar'


const OutboundNew = props => (
  <div>
    <NewOutbound/>
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('outbound-new-form')
  ReactDOM.render(<OutboundNew/>, node)
})
