import React, {Component} from "react"
import PropTypes from "prop-types"

class HelloWorld extends Component {
  componentDidMount(){
  }

  render() {
    return (
      <div>
      </div>
    );
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string
};
export default HelloWorld
