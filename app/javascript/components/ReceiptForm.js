import React from "react"
import PropTypes from "prop-types"

class ReceiptForm extends React.Component {
  constructor(props) {
    super(props)
      this.state = {
        store: '',
        total: '',
        errors: props.errors || ""
      }

    this.handleReceiptChange = this.handleReceiptChange.bind(this)
    this.handleReceiptForm = this.handleReceiptForm.bind(this)
  }

  handleReceiptChange(input) {
    this.setState({value: input})
  }

  handleReceiptForm() {
    var self = this
    var form = new FormData(document.getElementById('receipt-form'))
    fetch("http://localhost:3000/receipts/new", {
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
        <form className="receipt-form" method="post" action={"/trips/" + this.props.trip.id + "/receipts"} onSubmit={this.handleReceiptForm} encType="multipart/form-data">
          <h2>Add a Receipt</h2>
          <input type="hidden" name="authenticity_token" value={token} readOnly={true} />

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
            <input type="hidden" name="authenticity_token" value={token} readOnly={true} />

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
