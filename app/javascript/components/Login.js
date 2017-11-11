import React from "react"
import PropTypes from "prop-types"

class Login extends React.Component {

  constructor(props) {
    super(props)
      this.state = {
        email: '',
        password: ''
      }

    this.handleLoginChange = this.handleLoginChange.bind(this)
    this.handleLoginForm = this.handleLoginForm.bind(this)
  }

  handleLoginChange(input) {
    this.setState({value: input})
  }

  handleLoginForm() {
    var self = this
    var form = new FormData(document.getElementById('login-form'))
    console.log(form)
    fetch('http://localhost:3000/users/sign_in', {
      method: "POST",
      headers: {'X-CSRF-Token': token
      },
      body: form
    }).then((response) => response.json())
    .catch(function(error){
      console.log(error.message);
    });
  }

  render () {
    return (
      <form className="login-form" onSubmit={this.handleLoginForm} method="post">
        <h2>Login</h2>

        <label htmlFor="email">Email</label>
        <input type="email" name="email" onChange={this.handleLoginChange} />

        <label htmlFor="password">Password</label>
        <input type="password" name="password" onChange={this.handleLoginChange} />

        <button type="submit">Login</button>
      </form>
    );
  }
}

export default Login
