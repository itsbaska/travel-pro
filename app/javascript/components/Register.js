import React from "react"
import PropTypes from "prop-types"
class Register extends React.Component {
  render () {
    return (
      <form className="register-form">
        <h2>Register</h2>

        <label htmlFor="first_name">First Name</label>
        <input type="text" name="first_name"/>

        <label htmlFor="last_name">Last Name</label>
        <input type="text" name="last_name"/>

        <label htmlFor="phone_number">Phone Number</label>
        <input type="text" name="phone_number"/>

        <label htmlFor="email">Email</label>
        <input type="email" name="email"/>

        <label htmlFor="password">Password</label>
        <input type="password" name="password"/>

        <button type="submit">Register</button>
      </form>
    );
  }
}

export default Register
