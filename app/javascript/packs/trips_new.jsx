import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import NewTrip from '../components/NewTrip'
import NavigationBar from '../components/NavigationBar'

const TripNew = props => (
	<div className="main-content">
		<NewTrip/>
	</div>
)

document.addEventListener('DOMContentLoaded', () => {
	const node = document.getElementById('trip-new-form')
	ReactDOM.render(<TripNew/>, node)
})
