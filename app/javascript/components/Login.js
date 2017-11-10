import React, {Component} from "react"
import PropTypes from "prop-types"
class Login extends Component {
  componentDidMount(){
    console.log(this.props)
  }

  render() {
    return (
      <div>
        <label>{this.props}</label>
      </div>
    );
  }
}

Login.propTypes = {
  email: PropTypes.string,
  password: PropTypes.string
};
export default Login
