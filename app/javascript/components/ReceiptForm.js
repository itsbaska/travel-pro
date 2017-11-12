import React from "react"
import PropTypes from "prop-types"

class ReceiptForm extends React.Component {
  constructor(props) {
    super(props)
    console.log(props)
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
    {/* FIXME */}
    return (
    <form className="receipt-form" method="post" action={"/trips/" + 1 + "/receipts"} onSubmit={this.handleReceiptForm}>
        <h1>{this.state.errors}</h1>
        <h2>Register</h2>

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

export default ReceiptForm
