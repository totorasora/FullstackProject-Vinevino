import React from 'react';
import { NavLink } from 'react-router-dom';
import { useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
import LoginFormModal from '../LoginFormModal';
// import SignupFormModal from '../SignupFormModal';
import './Navigation.css';

function Navigation() {
  const sessionUser = useSelector(state => state.session.user);

  let sessionLinks;
  if (sessionUser) {
    sessionLinks = (
      <>
      <ProfileButton user={sessionUser} />
      </>
    );
  } else {
    sessionLinks = (
      <>
        <div>
          <LoginFormModal />
        </div>
      </>
    );
  }

  return (
    <>
      <NavLink exact to="/">
        <div className="home-button"></div>
      </NavLink>
      {sessionLinks}
    </>
  );
}

export default Navigation;
