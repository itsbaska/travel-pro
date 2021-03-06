import React from "react"
import PropTypes from "prop-types"
import Errors from "./Errors.js"

class NewOutbound extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      airline: '',
      airport: '',
      arrival: '',
      depature: '',
      trip: props.data || props.trip,
      token: '',
      errors: props.errors || ''
    }

    this.handleNewOutboundChange = this.handleNewOutboundChange.bind(this)
    this.handleNewOutboundSubmit = this.handleNewOutboundSubmit.bind(this)
  }

  componentDidMount(){
    const tokenGuyyyy = document.getElementsByTagName('meta')[1].content
    this.setState({token:tokenGuyyyy})
  }

  handleNewOutboundChange(input) {
    this.setState({value: input})
  }

  handleNewOutboundSubmit(){
    var form = new FormData(document.getElementById('outbound-new-form'))
    fetch({
      method: "POST",
      headers: {'X-CSRF-Token': token},
      body: form
    }).then((response) => response.json())
  }

  render () {

    if (this.state.errors.length > 0 ) {
      return (
        <div>
        <form className="outbound-new-form" method="post" action={"/trips/" + this.state.trip.id + "/outbounds"} onSubmit={this.handleNewOutboundSubmit}>
        <input type="hidden" name="authenticity_token" value={this.state.token} readOnly={true} />
          <h2>Add Outbound Booking Info</h2>
          <Errors>{this.state.errors}</Errors>

          <label htmlFor="airport">Airport: </label>
          <input type="text" name="airport" onChange={this.handleNewOutboundChange} />

          <label htmlFor="airline">Airline: </label>
          <input type="text" name="airline" onChange={this.handleNewOutboundChange} />

          <label htmlFor="arrival">Arrival: </label>
          <input type="datetime-local" name="arrival" onChange={this.handleNewOutboundChange} />

          <label htmlFor="departure">Departure: </label>
          <input type="datetime-local" name="departure" onChange={this.handleNewOutboundChange} />

           <input type="submit" value="Save" />
        </form>
        </div>
      );
    } else {
      return (
        <form className="outbound-new-form" method="post" action={"/trips/" + this.state.trip.id + "/outbounds"} onSubmit={this.handleNewOutboundSubmit}>
        <input type="hidden" name="authenticity_token" value={this.state.token} readOnly={true} />
          <h2>Add Outbound Booking Info</h2>

          <label htmlFor="airport">Airport: </label>
          <input type="text" name="airport" onChange={this.handleNewOutboundChange} placeholder="O'Hare"/>

          <label htmlFor="airline">Airline: </label>
          <input type="text" name="airline" onChange={this.handleNewOutboundChange} placeholder="Emirates"/>

          <label htmlFor="arrival">Arrival: </label>
          <input type="datetime-local" name="arrival" onChange={this.handleNewOutboundChange} />

          <label htmlFor="departure">Departure:</label>
          <input type="datetime-local" name="departure" onChange={this.handleNewOutboundChange} />

           <input type="submit" value="Save" />
        </form>
      );
    }
  }
}

export default NewOutbound
