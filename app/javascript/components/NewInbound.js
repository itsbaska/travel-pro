import React from "react"
import PropTypes from "prop-types"
import Errors from "./Errors.js"

class NewInbound extends React.Component {
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

    this.handleNewInboundChange = this.handleNewInboundChange.bind(this)
    this.handleNewInboundSubmit = this.handleNewInboundSubmit.bind(this)
  }

  componentDidMount(){
    const tokenGuyyyy = document.getElementsByTagName('meta')[1].content
    this.setState({token:tokenGuyyyy})
  }

  handleNewInboundChange(input) {
    this.setState({value: input})
  }

  handleNewInboundSubmit(){
    var form = new FormData(document.getElementById('inbound-new-form'))
    fetch("http://localhost:3000/trips/"+ this.state.trip.id +"/inbounds/new", {
      method: "POST",
      headers: {'X-CSRF-Token': token},
      body: form
    }).then((response) => response.json())
  }

  render () {
    if (this.state.errors.length > 0 ) {
      return (
       <div>

        <form className="inbound-new-form" method="post" action={"/trips/" + this.state.trip.id + "/inbounds"} onSubmit={this.handleNewInboundSubmit}>
        <input type="hidden" name="authenticity_token" value={this.state.token} readOnly={true} />

          <h2>Add Booking Info</h2>
          <Errors>{this.state.errors}</Errors>
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
        </form></div>
      );
    } else {
      return (
        <form className="inbound-new-form" method="post" action={"/trips/" + this.state.trip.id + "/inbounds"} onSubmit={this.handleNewInboundSubmit}>
          <input type="hidden" name="authenticity_token" value={this.state.token} readOnly={true} />

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
