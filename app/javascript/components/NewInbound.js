import React from "react"
import PropTypes from "prop-types"

class NewInbound extends React.Component {
  render () {
    return (
      <form className="inbound-new-form">
        <h2>Add Booking Info</h2>
        <h4>Inbound</h4>

        <label htmlFor="airport">Airport:</label>
        <input type="text" name="airport"/>

        <label htmlFor="airline">Airline:</label>
        <input type="text" name="airline"/>

        <label htmlFor="arrival">Arrival:</label>
        <input type="datetime-local" name="arrival"/>

        <label htmlFor="departure">Departure:</label>
        <input type="datetime-local" name="departure"/>

        <a href="/">Save</a> 
      </form>
    );
  }
}

export default NewInbound