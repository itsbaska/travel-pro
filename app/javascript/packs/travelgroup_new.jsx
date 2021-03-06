import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import NewTravelgroup from '../components/NewTravelgroup'

const TravelgroupNew = props => (
  <div>
    <h2 className="secondary-title">Invite a Traveller</h2>
		<NewTravelgroup data={props.trip}/>
	</div>
)

document.addEventListener('DOMContentLoaded', () => {
	const node = document.getElementById('travelgroup-new-form')
	const data = JSON.parse(node.getAttribute('data'))
	ReactDOM.render(<TravelgroupNew {...data}/>, node)
})
