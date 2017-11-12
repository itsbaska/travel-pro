import React from "react"
import PropTypes from "prop-types"

class Logout extends React.Component {

  render () {
    return (
      <form className="logout-form" method="delete" action="/sessions">

        <button type="submit">Logout</button>
      </form>
      )
    }
  }

export default Logout
