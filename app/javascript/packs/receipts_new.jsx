import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import ReceiptForm from '../components/ReceiptForm'


const SignUp = props => (
  <div>
    <ReceiptForm data={props}/>
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('receipt-form')
  const data = JSON.parse(node.getAttribute('data'))
  ReactDOM.render(<ReceiptForm {...data}/>, node)
})
