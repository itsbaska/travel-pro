import React from "react"
import PropTypes from "prop-types"
import $ from 'jquery'

class NewTravelgroup extends React.Component {
   constructor(props) {
    super(props)
    this.state = {
      travellerEmail: '',
      trip: props.data,
      errors: props.errors || ''
    }

  this.handleNewTravelgroupChange = this.handleNewTravelgroupChange.bind(this)
  this.handleNewTravelgroupSubmit = this.handleNewTravelgroupSubmit.bind(this)
  }

  handleNewTravelgroupChange(input) {
    this.setState({value: input})
  }

  handleNewTravelgroupSubmit() {
    var form = new FormData(document.getElementById('travelgroup-new-form'))
    fetch("http://localhost:3000/trips/"+ this.state.trip.id +"/travelgroupings/new", {
      method: "POST",
     headers: {'X-CSRF-Token': token
      },
      body: form
    }).then((response) => response.json())
  }

  render () {
    const token = $('meta[name="csrf-token"]').attr('content');

    if (this.state.errors.length > 0){
      return (
        <div>
        <h1>{this.state.errors}</h1>
        <form className="travelgroup-new-form" method="post" action={"/trips/" + this.state.trip.id + "/travelgroupings"} onSubmit={this.handleNewTravelgroupSubmit}>
          <h2>Create New Trip</h2>
          <input type="hidden" name="authenticity_token" value={token} readOnly={true} />
         <label htmlFor="travellerEmail">Traveller's Email:</label>
          <input type="text" name="travellerEmail" onChange={this.handleNewTravelgroupChange}/>

          <input type="submit" value="Save" />
        </form>
        </div>
      );
    } else {
      return (
        <form className="travelgroup-new-form" method="post" action={"/trips/" + this.state.trip.id + "/travelgroupings"} onSubmit={this.handleNewTravelgroupSubmit}>
          <h2>Create New Trip</h2>
          <input type="hidden" name="authenticity_token" value={token} readOnly={true} />
          <label htmlFor="travellerEmail">Traveller's Email:</label>
          <input type="text" name="travellerEmail" onChange={this.handleNewTravelgroupChange}/>

          <input type="submit" value="Invite" />
        </form>
      );
    }
  }
}

export default NewTravelgroup
