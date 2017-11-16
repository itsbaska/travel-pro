import React from "react"
import PropTypes from "prop-types"
import Errors from "./Errors.js"
import Dropzone from 'react-dropzone'
import sha1 from 'sha1'
import superagent from 'superagent'

class ReceiptForm extends React.Component {
  constructor(props) {
    super(props)

      this.state = {
        store: '',
        total: '',
        token: '',
        images: [],
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

  uploadFile(files) {
    const image = files[0]

    const cloudName = 'dwbghyzyd'
    const url = 'https://api.cloudinary.com/v1_1/'+cloudName+'/image/upload'
    const timestamp = Date.now()/1000
    const uploadPreset = this.props.receipt_name
    const paramsStr = 'timestamp='+timestamp+'&upload_preset='+uploadPreset+this.props.receipt_code

    const signature = sha1(paramsStr)

    const params ={
      'api_key': this.props.receipt_stuff,
      'timestamp': timestamp,
      'upload_preset': uploadPreset,
      'signature': signature
    }

    let uploadRequest = superagent.post(url)
    uploadRequest.attach('file', image)

    Object.keys(params).forEach((key) => {
      uploadRequest.field(key, params[key])
    })

    uploadRequest.end((err,resp) => {
      if (err) {
        alert(err)
        return
      }
      const uploaded = resp.body
      let updatedImages = Object.assign([], this.state.images)
      updatedImages.push(uploaded)
      this.setState({
        images: updatedImages
      })
    })
  }

  render() {
    const list = this.state.images.map((image, i) => {
      return (
        <li key={i}>
          <img style={{width:72}} src={image.secure_url} />
        </li>
      )
    })
    if (this.state.errors.length > 0){
      return (
        <div>
        <form className="receipt-form" method="post" action={"/trips/" + this.props.trip.id + "/receipts"} onSubmit={this.handleReceiptForm} encType="multipart/form-data">
          <h2>Add a Receipt</h2>
          <Errors>{this.state.errors}</Errors>
          <input type="hidden" name="authenticity_token" value={this.state.token} readOnly={true} />

          <label htmlFor="store">Store: </label>
          <input type="text" name="store" onChange={this.handleReceiptChange }placeholder="Target"/>

          <label htmlFor="total">Total: $</label>
          <input type="text" name="total" onChange={this.handleReceiptChange} placeholder="25.50"/>

            <label htmlFor="receipt">Receipt:</label>
            <Dropzone className="receipt-drop-zone" onDrop={this.uploadFile.bind(this)}>Enter Receipt Here</Dropzone>
             <input type="hidden"  name="photo" value={this.state.images.map((image) => image.url)} onChange={this.handleReceiptChange} />
            <ol>
              {list}
            </ol>
          <button type="submit">Save Receipt</button>
        </form>
      </div>
      );
    } else {

      const list = this.state.images.map((image, i) => {
      return (
        <li key={i}>
          <img style={{width:72}} src={image.secure_url} />
        </li>
      )
    })
      return (
        <form className="receipt-form" method="post" action={"/trips/" + this.props.trip.id + "/receipts"} onSubmit={this.handleReceiptForm} encType="multipart/form-data">
            <h2>Add a Receipt</h2>
            <input type="hidden" name="authenticity_token" value={this.state.token} readOnly={true} />

            <label htmlFor="store">Store: </label>
            <input type="text" name="store" onChange={this.handleReceiptChange} placeholder="Target"/>

            <label htmlFor="total">Total: $</label>
            <input type="text" name="total" onChange={this.handleReceiptChange} placeholder="25.50"/>

            <label htmlFor="receipt">Receipt:</label>
            <Dropzone className="receipt-drop-zone" onDrop={this.uploadFile.bind(this)}>Enter Receipt Here</Dropzone>
            <input type="hidden" name="photo" value={this.state.images.map((image) => image.url)} onChange={this.handleReceiptChange} />
             <ol>
              {list}
            </ol>
            <button type="submit">Save Receipt</button>
        </form>
      );
    }
  }
}

export default ReceiptForm
