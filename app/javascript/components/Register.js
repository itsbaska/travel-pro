import React from "react"
import PropTypes from "prop-types"

class Register extends React.Component {
  constructor(props) {
    super(props)
    console.log(props)
      this.state = {
        first_name: '',
        last_name: '',
        email: '',
        phone_number: '',
        password: '',
        errors: props.errors || ""
      }

    this.handleRegisterChange = this.handleRegisterChange.bind(this)
    this.handleRegisterForm = this.handleRegisterForm.bind(this)
  }

  handleRegisterChange(input) {
    this.setState({value: input})
  }

  handleRegisterForm() {
    var self = this
    var form = new FormData(document.getElementById('register-form'))
    fetch("http://localhost:3000/users/sign_up", {
      method: "POST",
      headers: {'X-CSRF-Token': token
      },
      body: form
    }).then((response) => response.json())
  }

  render () {
    if (this.state.errors.length > 0) {
      return (
      <div>
      <h1>{this.state.errors}</h1>
      <form className="register-form" method="post" action="/users" onSubmit={this.handleRegisterForm}>
          <h2>Register</h2>

          <label htmlFor="first_name">First Name</label>
          <input type="text" name="first_name" onChange={this.handleRegisterChange}/>

          <label htmlFor="last_name">Last Name</label>
          <input type="text" name="last_name" onChange={this.handleRegisterChange}/>

          <label htmlFor="phone_number">Phone Number</label>
          <input type="text" name="phone_number" onChange={this.handleRegisterChange}/>

          <label htmlFor="email">Email</label>
          <input type="email" name="email" onChange={this.handleRegisterChange}/>

          <label htmlFor="password">Password</label>
          <input type="password" name="password" onChange={this.handleRegisterChange}/>

          <button type="submit">Register</button>
      </form>
      </div>
      );
    } else {
      return (
        <form className="register-form" method="post" action="/users" onSubmit={this.handleRegisterForm}>
          <h2>Register</h2>

          <label htmlFor="first_name">First Name</label>
          <input type="text" name="first_name" onChange={this.handleRegisterChange}/>

          <label htmlFor="last_name">Last Name</label>
          <input type="text" name="last_name" onChange={this.handleRegisterChange}/>

          <label htmlFor="phone_number">Phone Number</label>
          <input type="text" name="phone_number" onChange={this.handleRegisterChange}/>

          <label htmlFor="email">Email</label>
          <input type="email" name="email" onChange={this.handleRegisterChange}/>

          <label htmlFor="password">Password</label>
          <input type="password" name="password" onChange={this.handleRegisterChange}/>

          <button type="submit">Register</button>
        </form>
      );
    }
  }
}

export default Register
