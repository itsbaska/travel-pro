import React, {Component} from "react"
import PropTypes from "prop-types"
class HelloWorld extends Component {
  componentDidMount(){
    console.log(this.props)
  }

  render() {
    return (
      <div>
       required fwegthing
      </div>
    );
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string
};
export default HelloWorld
