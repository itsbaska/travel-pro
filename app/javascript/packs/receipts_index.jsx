import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Receipts from '../components/Receipts'



const ReceiptIndex = props => (
  <div>
    <Receipts data={props.receipts}/>
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('all-receipts')
  const data = JSON.parse(node.getAttribute('data'))
  ReactDOM.render(<ReceiptIndex {...data}/>, node)
})
