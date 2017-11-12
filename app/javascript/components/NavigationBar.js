import React from "react"
import PropTypes from "prop-types"

class NavigationBar extends React.Component {
  constructor(args) {
    super(args)
    this.state = {
      loggedIn: ""
    }
  }


  componentDidMount() {
    console.log(this.props)
    this.setState({loggedIn: this.props.data.loggedIn})
    console.log(this.state.loggedIn)

  }

  render () {
    return (
    <nav>
      <ul>
        <li><a href='/'>Home</a></li>
        <li><a href='/login'>Login</a></li>
        <li><a href='/users/sign_up'>Register</a></li>
      {/* hard coded user id*/}
        <li><a href={'/users/1/dashboards'}>Dashboard</a></li>
      </ul>
    </nav>
    )
  }
}

export default NavigationBar
