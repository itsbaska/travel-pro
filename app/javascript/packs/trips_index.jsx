// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import HelloWorld from '../components/HelloWorld'
import Login from '../components/Login'


const Hello = props => (
  <div>Hello {props.name}! <HelloWorld/>
    Hello {props.message}!
  </div>
)

Hello.defaultProps = {
  name: 'David'
}

Hello.propTypes = {
  name: PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('hello-react')
  const data = JSON.parse(node.getAttribute('data'))

  ReactDOM.render(<Hello {...data} />, node)
})
