import React from "react"
import PropTypes from "prop-types"

class NewTravelgroup extends React.Component {
   constructor(props) {
    super(props)
    this.state = {
      travellerEmail: '',
      trip: props.data || props.trip,
      token: '',
      errors: props.errors || ''
    }

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

        <h1>Invite a Traveller</h1>
          <Errors>{this.state.errors}</Errors>
        <form className="travelgroup-new-form" method="post" action={"/trips/" + this.state.trip.id + "/travelgroupings"} onSubmit={this.handleNewTravelgroupSubmit}>
          <h2>Create New Trip</h2>
          <input type="hidden" name="authenticity_token" value={this.state.token} readOnly={true} />
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
          <input type="hidden" name="authenticity_token" value={this.state.token} readOnly={true} />
          <label htmlFor="travellerEmail">Traveller's Email:</label>
          <input type="text" name="travellerEmail" onChange={this.handleNewTravelgroupChange}/>

          <input type="submit" value="Invite" />
        </form>
      );
    }
  }
}

export default NewTravelgroup
