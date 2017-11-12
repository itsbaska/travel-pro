import React from "react"
import PropTypes from "prop-types"

class Logout extends React.Component {
  constructor(props){
    super(props)
    this.handleLogoutForm = this.handleLogoutForm.bind(this)
  }

  handleLogoutForm(event) {
    event.preventDefault()
    console.log("logout")
    fetch('http://localhost:3000/logout', {
      method: "DELETE"
    })
  }

  render () {
    return (
      <form className="login-form" onSubmit={this.handleLogoutForm} >
        <input type="submit" value="Logout"/>
      </form>
      )
    }
  }

export default Logout
