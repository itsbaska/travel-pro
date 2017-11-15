import React from "react"
import PropTypes from "prop-types"
import Logout from "./Logout.js"

class NavigationBar extends React.Component {
  constructor(args) {

    super(args)
    this.state = {
      loggedIn: false,
      currentUser: ""
    }
    this.setNothing = this.setNothing.bind(this)
  }

  setNothing() {
    this.setState({loggedIn: false})
  }

  componentDidMount() {
    this.setState({loggedIn: this.props.data.loggedIn, currentUser: this.props.data.currentUser})
  }

  render () {
    if (this.state.loggedIn === false) {
      return (
      <div>
        <nav className="sidebar">
          <ul className="menu">
            <li className="login"><a href='/login'>Login</a></li>
            <li className="register"><a href='/users/sign_up'>Register</a></li>
          </ul>
        </nav>
      </div>

      )
    } else {
      return (
      <div>
        <nav className="sidebar">
          <ul className="menu">
            <li className="dashboard-button"><a href={"/users/" + this.state.currentUser.id + "/dashboards"}>Dashboard</a></li>
            <li className="create-trip-button"><a href="/trips/new"><button>Create Trip</button></a></li>
          </ul>
        </nav>
      </div>
      )
    }
  }
}

export default NavigationBar
