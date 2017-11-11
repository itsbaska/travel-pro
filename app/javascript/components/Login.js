import React from "react"
import PropTypes from "prop-types"
class Login extends React.Component {
  render () {
     console.log("hello")
    return (
      <form className="login-form">
        <h2>Login</h2>

        <label htmlFor="email">Email</label>
        <input type="email" name="email"/>

        <label htmlFor="password">Password</label>
        <input type="password" name="password"/>

        <button type="submit">Login</button>
      </form>
    );
  }
}

export default Login
