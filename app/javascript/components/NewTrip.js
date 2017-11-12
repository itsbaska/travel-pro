import React from "react"
import PropTypes from "prop-types"

class NewTrip extends React.Component {
  render () {
    return (
      <form className="trip-new-form">
        <h2>Create New Trip</h2>

        <label htmlFor="name">Name:</label>
        <input type="text" name="name"/>

        <label htmlFor="location">Location:</label>
        <input type="text" name="location"/>

        <label htmlFor="budget">Budget:</label>
        <input type="text" name="budget"/>

        <a href="/trips">Add Traveller</a> 
      </form>
    );
  }
}

export default NewTrip
