import React from "react"
import PropTypes from "prop-types"
import $ from 'jquery'


class NewInbound extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      airline: '',
      airport: '',
      arrival: '',
      depature: '',
      trip: props.data,
      errors: props.errors || ''
    }
    console.log(this.state.errors)
    this.handleNewInboundChange = this.handleNewInboundChange.bind(this)
    this.handleNewInboundSubmit = this.handleNewInboundSubmit.bind(this)
  }

  handleNewInboundChange(input) {
    this.setState({value: input})
  }

  handleNewInboundSubmit(){
    var form = new FormData(document.getElementById('outbound-new-form'))
    fetch("http://localhost:3000/trips/"+ this.state.trip.id +"/outbounds/new", {
      method: "POST",
      headers: {'X-CSRF-Token': token},
      body: form
    }).then((response) => response.json())
  }

  render () {
    const token = $('meta[name="csrf-token"]').attr('content');

    if (this.state.errors.length > 0 ) {
      return (
        <form className="inbound-new-form" method="post" action={"/trips/" + this.state.trip.id + "/inbounds"} onSubmit={this.handleNewInboundSubmit}>
        <input type="hidden" name="authenticity_token" value={token} readOnly={true} />

          <h2>Add Booking Info</h2>
          <h4>Inbound</h4>

          <label htmlFor="airport">Airport:</label>
          <input type="text" name="airport" onChange={this.handleNewInboundChange} />

          <label htmlFor="airline">Airline:</label>
          <input type="text" name="airline" onChange={this.handleNewInboundChange} />

          <label htmlFor="arrival">Arrival:</label>
          <input type="datetime-local" name="arrival" onChange={this.handleNewInboundChange} />

          <label htmlFor="departure">Departure:</label>
          <input type="datetime-local" name="departure" onChange={this.handleNewInboundChange} />

           <input type="submit" value="Save" />
        </form>
      );
    } else {
      return (
        <form className="inbound-new-form" method="post" action={"/trips/" + this.state.trip.id + "/inbounds"} onSubmit={this.handleNewInboundSubmit}>
          <input type="hidden" name="authenticity_token" value={token} readOnly={true} />

          <h2>Add Booking Info</h2>
          <h4>Inbound</h4>

          <label htmlFor="airport">Airport:</label>
          <input type="text" name="airport" onChange={this.handleNewInboundChange}/>

          <label htmlFor="airline">Airline:</label>
          <input type="text" name="airline" onChange={this.handleNewInboundChange}/>

          <label htmlFor="arrival">Arrival:</label>
          <input type="datetime-local" name="arrival" onChange={this.handleNewInboundChange}/>

          <label htmlFor="departure">Departure:</label>
          <input type="datetime-local" name="departure" onChange={this.handleNewInboundChange}/>

           <input type="submit" value="Save" />
        </form>
      )
    }
  }
}

export default NewInbound
