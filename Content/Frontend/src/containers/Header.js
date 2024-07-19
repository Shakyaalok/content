import React, { useState, useEffect } from 'react'
import {
  CContainer,
  CNavbarBrand,
  CCollapse,
  CNavbarNav,
  CNavItem,
  CNavLink,
  CNavbar,
  CNavbarToggler,
  CImage,


} from '@coreui/react'
import { Link, useNavigate } from 'react-router-dom'
import Logo from '../assets/icons/logo-white.png'
import '../views/Css/headers.css';
import { isTokenExpire } from '../views/gradeSubject';
import { BsList } from "react-icons/bs";
import { RxCross2 } from "react-icons/rx";



const Header = () => {
  const [visible, setVisible] = useState(false);
  const [isLoggedIn, setIsLogggedIn] = useState(false)
  const navigate = useNavigate();
  const user_info = JSON.parse(localStorage.getItem('user_info'));



  useEffect(() => {
    if (!user_info || isTokenExpire(user_info?.accessToken)) {
      localStorage.removeItem('user_info');
      localStorage.removeItem('rcontent');
      navigate('/login');
      setIsLogggedIn(false)
    } else {
      setIsLogggedIn(true)
    }
  }, [user_info, navigate])


  const logoutHandler = () => {
    localStorage.removeItem('user_info');
    localStorage.removeItem('rcontent');
    navigate('/login');
  }


  return (
    <CNavbar expand="lg" className={`bg-body-teal fixed-header`}>
      <CContainer fluid>

        <CNavbarBrand as={Link} to='/'>
          <CImage src={Logo} className='logo' />
        </CNavbarBrand>
        <CNavbarToggler>
          <div onClick={() => setVisible(!visible)} className="navbar-toggler-button">
            <span className="navbar-toggler-icon">  {visible ? <RxCross2 /> : <BsList />}</span>
          </div>
        </CNavbarToggler>
        <CCollapse className="navbar-collapse" color='success' visible={visible}>
          <CNavbarNav>
            <CNavItem>
              <CNavLink as={Link} to='/' active>Home</CNavLink>
            </CNavItem>
            <CNavItem>
              <CNavLink as={Link} to='/k12' active>K12</CNavLink>
            </CNavItem>
            <CNavItem>
              <CNavLink as={Link} to='/higher-ed' active>Higher Ed</CNavLink>
            </CNavItem>
            <CNavItem>
              <CNavLink as={Link} to='/enterprises' active>Enterprises</CNavLink>
            </CNavItem>
            <CNavItem>
              <CNavLink as={Link} to='/virtual-tour' active>Virtual Tour</CNavLink>
            </CNavItem>
            <CNavItem>
              {isLoggedIn === false ? <CNavLink as={Link} to='/login' active>Login</CNavLink> : <CNavLink as={Link} onClick={logoutHandler} active>Logout</CNavLink>}
            </CNavItem>
          </CNavbarNav>
        </CCollapse>
      </CContainer>
    </CNavbar>
  )
}

export default Header
