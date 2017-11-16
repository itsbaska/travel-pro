import React from "react"
import PropTypes from "prop-types"
import Errors from "./Errors.js"

class NewTravelgroup extends React.Component {
   constructor(props) {
    super(props)
    this.state = {
      travellerEmail: '',
      trip: props.data || props.trip,
      token: '',
      errors: props.errors || ''
    }
  console.log(this.state.errors)
  this.handleNewTravelgroupChange = this.handleNewTravelgroupChange.bind(this)
  this.handleNewTravelgroupSubmit = this.handleNewTravelgroupSubmit.bind(this)
  }

  handleNewTravelgroupChange(input) {
    this.setState({value: input})
  }

  componentDidMount(){
    const tokenGuyyyy = document.getElementsByTagName('meta')[1].content
    this.setState({token:tokenGuyyyy})
  }

  handleNewTravelgroupSubmit() {
    var form = new FormData(document.getElementById('travelgroup-new-form'))
    fetch({
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
        <form className="travelgroup-new-form" method="post" action={"/trips/" + this.state.trip.id + "/travelgroupings"} onSubmit={this.handleNewTravelgroupSubmit}>
          <input type="hidden" name="authenticity_token" value={this.state.token} readOnly={true} />
          <Errors>{this.state.errors}</Errors>
          <label htmlFor="travellerEmail">Traveller's Email:</label>
          <input type="email" name="travellerEmail" onChange={this.handleNewTravelgroupChange} placeholder="example@email.com" />
          <input type="submit" value="Invite" />
        </form>
        </div>
      );
    } else {
      return (
        <form className="travelgroup-new-form" method="post" action={"/trips/" + this.state.trip.id + "/travelgroupings"} onSubmit={this.handleNewTravelgroupSubmit}>
          <input type="hidden" name="authenticity_token" value={this.state.token} readOnly={true} />
          <label htmlFor="travellerEmail">Traveller's Email:</label>
          <input type="email" name="travellerEmail" onChange={this.handleNewTravelgroupChange} placeholder="example@email.com" />
          <input type="submit" value="Invite" />
        </form>
      );
    }
  }
}

export default NewTravelgroup
