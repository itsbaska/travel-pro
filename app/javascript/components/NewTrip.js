/* global window document */

import React from "react"
import PropTypes from "prop-types"

class NewTrip extends React.Component {
   constructor(props) {
    super(props)
    this.state = {
      name: '',
      location: '',
      budget: '',
      errors: props.errors || '',
      token: ''
    }

  this.handleNewTripChange = this.handleNewTripChange.bind(this)
  this.handleNewTripSubmit = this.handleNewTripSubmit.bind(this)
  }

  componentDidMount(){
    const tokenGuyyyy = document.getElementsByTagName('meta')[1].content
    this.setState({token:tokenGuyyyy})
  }

  handleNewTripChange(input) {
    this.setState({value: input})
  }

  handleNewTripSubmit() {
    var form = new FormData(document.getElementById('trip-new-form'))
    fetch("http://localhost:3000/trips/new", {
      method: "POST",
     headers: {'X-CSRF-Token': token
      },
      body: form
    }).then((response) => response.json())
  }

  render () {

    if (this.state.errors.length > 0){
      return (
        <div>
        <h1>{this.state.errors}</h1>
        <form className="trip-new-form" method="post" action="/trips" onSubmit={this.handleNewTripSubmit}>
          <h2>Create New Trip</h2>
          <input type="hidden" name="authenticity_token" value={this.state.token} readOnly={true} />
          <label htmlFor="name">Name:</label>
          <input type="text" name="name" onChange={this.handleNewTripChange}/>

          <label htmlFor="location">Location:</label>
          <input type="text" name="location" onChange={this.handleNewTripChange}/>

          <label htmlFor="budget">Budget:</label>
          <input type="text" name="budget" onChange={this.handleNewTripChange}/>

          <input type="submit" value="Save" />
        </form>
        </div>
      );
    } else {
      return (
        <form className="trip-new-form" method="post" action="/trips" onSubmit={this.handleNewTripSubmit}>
          <h2>Create New Trip</h2>
          <input type="hidden" name="authenticity_token" value={this.state.token} readOnly={true} />
          <label htmlFor="name">Name:</label>
          <input type="text" name="name" onChange={this.handleNewTripChange}/>

          <label htmlFor="location">Location:</label>
          <input type="text" name="location" onChange={this.handleNewTripChange}/>

          <label htmlFor="budget">Budget:</label>
          <input type="text" name="budget" onChange={this.handleNewTripChange}/>

          <input type="submit" value="Save" />
        </form>
      );
    }
  }
}

export default NewTrip
