import React from "react"
import PropTypes from "prop-types"
import Logout from "./Logout.js"

class NavigationBar extends React.Component {
  constructor(args) {

    super(args)
    this.state = {
      loggedIn: false,
      currentUser: "",
      menuOpen: false
    }
    this.handleMenu = this.handleMenu.bind(this)
    this.setNothing = this.setNothing.bind(this)
  }

  handleMenu() {
    if (this.state.menuOpen === false) {
      this.setState({menuOpen: true})
    } else {
      this.setState({menuOpen: false})
    }
  }

  setNothing() {
    this.setState({loggedIn: false})
  }

  componentDidMount() {
    this.setState({loggedIn: this.props.data.loggedIn, currentUser: this.props.data.currentUser})
  }

  render () {
    var menuItems = "";
    if (this.state.loggedIn) {
      menuItems = (<ul className="menu"><li className="dashboard-button"><a href={"/users/" + this.state.currentUser.id + "/dashboards"}>Dashboard</a></li>
            <li className="create-trip-button"><a href="/trips/new"><button>Create Trip</button></a></li></ul>)
    }
    else {
      menuItems = (<ul className="menu"><li className="login"><a href='/login'>Login</a></li>
            <li className="register"><a href='/users/sign_up'>Register</a></li></ul>)
    }

    return (
      <div className={ this.state.menuOpen ? "whoosh" : "" } id="menu">
         <div className="page-title">
           <button onClick={this.handleMenu}><i className="fa fa-bars" aria-hidden="true"></i></button>
            <a href="/"><h1>travel pro&ensp;<i className="fa fa-plane" aria-hidden="true"></i></h1></a>
            <div></div>
          </div>
        <nav className="sidebar">
          { menuItems }
        </nav>
      </div>

      )
  }
}

export default NavigationBar
