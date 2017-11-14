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
      <nav>
        <h1>travel pro</h1>
        <ul className="menu">
          <li><a href='/'>Home</a></li>
          <li><a href='/login'>Login</a></li>
          <li><a href='/users/sign_up'>Register</a></li>
        </ul>
      </nav>
      )
    } else {
      return (
      <nav>
        <h1>travel pro&ensp;<i className="fa fa-plane" aria-hidden="true"></i></h1>
        <ul>
          <li><a href='/'>Home</a></li>
          <li><a href={"/users/" + this.state.currentUser.id + "/dashboards"}>Dashboard</a></li>
            <li><a href="/trips/new"><button>Create Trip</button></a></li>
          <li>< Logout setNothing={this.setNothing}/></li>
        </ul>
      </nav>
      )
    }
  }
}

export default NavigationBar
