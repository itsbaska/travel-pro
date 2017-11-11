import React from "react"
import PropTypes from "prop-types"

class NavigationBar extends React.Component {
  render () {
    return (
    <nav>
      <ul>
        <li><a href='/'>Home</a></li>
        <li><a href='/login'>Login</a></li>
        <li><a href='/register'>Register</a></li>
      </ul>
    </nav>
    )
  }
}

export default NavigationBar
