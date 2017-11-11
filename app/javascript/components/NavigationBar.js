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
      {/* hard coded user id*/}
        <li><a href='/users/1/dashboards'>Dashboard</a></li>
      </ul>
    </nav>
    )
  }
}

export default NavigationBar
