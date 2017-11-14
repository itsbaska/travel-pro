import React from "react"
import PropTypes from "prop-types"
import Errors from "./Errors.js"

class ReceiptForm extends React.Component {
  constructor(props) {
    super(props)
      this.state = {
        store: '',
        total: '',
        token: '',
        errors: props.errors || ""
      }

    this.handleReceiptChange = this.handleReceiptChange.bind(this)
    this.handleReceiptForm = this.handleReceiptForm.bind(this)
  }

  handleReceiptChange(input) {
    this.setState({value: input})
  }

  componentDidMount(){
    const tokenGuyyyy = document.getElementsByTagName('meta')[1].content
    this.setState({token:tokenGuyyyy})
  }

  handleReceiptForm() {
    var form = new FormData(document.getElementById('receipt-form'))
    fetch("http://localhost:3000/receipts/new", {
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
        <form className="receipt-form" method="post" action={"/trips/" + this.props.trip.id + "/receipts"} onSubmit={this.handleReceiptForm} encType="multipart/form-data">
          <h2>Add a Receipt</h2>
          <Errors>{this.state.errors}</Errors>
          <input type="hidden" name="authenticity_token" value={this.state.token} readOnly={true} />

          <label htmlFor="store">Store</label>
          <input type="text" name="store" onChange={this.handleReceiptChange}/>

          <label htmlFor="total">Total</label>
          <input type="text" name="total" onChange={this.handleReceiptChange}/>

          <label htmlFor="receipt">Receipt</label>
          <input type="file" name="photo" onChange={this.handleReceiptChange}/>

          <button type="submit">Save Receipt</button>
        </form>
      </div>
      );
    } else {
      return (
        <form className="receipt-form" method="post" action={"/trips/" + this.props.trip.id + "/receipts"} onSubmit={this.handleReceiptForm} encType="multipart/form-data">
            <h2>Add a Receipt</h2>
            <input type="hidden" name="authenticity_token" value={this.state.token} readOnly={true} />

            <label htmlFor="store">Store</label>
            <input type="text" name="store" onChange={this.handleReceiptChange}/>

            <label htmlFor="total">Total</label>
            <input type="text" name="total" onChange={this.handleReceiptChange}/>

            <label htmlFor="receipt">Receipt</label>
            <input type="file" name="photo" onChange={this.handleReceiptChange}/>

            <button type="submit">Save Receipt</button>
        </form>
      );
    }
  }
}

export default ReceiptForm
