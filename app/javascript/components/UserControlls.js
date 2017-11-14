import React from 'react';
import SessionStore from './session_store.js';
import AuthActions from './auth_actions.js';

class UserControls extends React.Component {
  handleLogout(e) {
    e.preventDefault();
    AuthActions.logout();
  },
  render() {
    if (SessionStore.isLoggedIn()) {
      return (
        <div className='UserControls'>
          <span>{SessionStore.getEmail}</span>
          <a href='#' onClick={this.handleLogout}>Logout</span>
        </div>
      );
    } else {
      return (
        <div className='UserControls'>
          <a href='#/login'>Login</a>
        </div>
      );
    }
  }
};

export default UserControls;
