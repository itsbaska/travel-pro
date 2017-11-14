import React from "react"
import PropTypes from "prop-types"
import Error from './Error'

const Errors = (props) =>
  <ul className="error">
    {props.children.map((error) => <Error key={error} error={error}/>)}
  </ul>

export default Errors
