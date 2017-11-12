import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import ReceiptForm from '../components/ReceiptForm'
import NavigationBar from '../components/NavigationBar'


const SignUp = props => (
  <div>
    <ReceiptForm/>
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('receipt-form')
  ReactDOM.render(<ReceiptForm/>, node)
})
