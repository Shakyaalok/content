import {
  CRow,
  CContainer,
  CFormInput

} from '@coreui/react';
import '../views/Css/navigation.css'
import { FaSearch } from "react-icons/fa";
import { ImCross } from "react-icons/im";
import { Link,useNavigate } from 'react-router-dom'
import { useState,useEffect } from 'react';
import Home from '../assets/icons/home.png'
import K12 from '../assets/icons/k-12.png'
import HeigherEd from '../assets/icons/higher-ed.png';
import VirtualTour from '../assets/icons/virtual-tour.png';
import Enterprise from '../assets/icons/enterprise.png'
import { isTokenExpire } from '../views/gradeSubject';




const Navigation = (props) => {

  const navigate = useNavigate();
  const [lensCrossToggler,setLensCrossToggler] = useState(false);
  const [inputText,setInputText] = useState('')
  const user_info = JSON.parse(localStorage.getItem('user_info'));


  useEffect(() => {
    if(!user_info || isTokenExpire(user_info?.accessToken)){
        localStorage.removeItem('user_info')
        navigate('/login');
      }
  }, [user_info,navigate]);


  const inputSeachHandler = (e) =>{
    props.onSearch(e.target.value);
    setInputText(e.target.value)
    if(e.target.value){
      setLensCrossToggler(true)
    }

    if(e.target.value===''){
      setLensCrossToggler(false)
    }
  }

  const clearSearchedTextHandler = () =>{
    props.onSearch('');
    setInputText('')
    setLensCrossToggler(false)
  }


  return (
    <CContainer className='bg-white' >
      <CRow className='home-navigation'>
        <Link to='/'>
          <div className='icon-text-adjustment' >
            <img alt='no-icons-found' src={Home} className='Three-d-icons'/>
            <div>All</div>
          </div>

        </Link>

        <Link to='/k12'>
          <div className='icon-text-adjustment' >
            <img alt='no-icons-found' src={K12} className='Three-d-icons'/>
            <div>K-12</div>
          </div>

        </Link>


        <Link to='/higher-ed'>
          <div className='icon-text-adjustment' >
            <img alt='no-icons-found' src={HeigherEd} className='Three-d-icons'/>
            <div>Higher Education</div>
          </div>

        </Link>


        <Link to='/enterprises'>
          <div className='icon-text-adjustment' >
            <img alt='no-icons-found' src={Enterprise} className='Three-d-icons' />
            <div>Enterprises</div>
          </div>
        </Link>


        <Link to='/virtual-tour'>
          <div className='icon-text-adjustment' >
            <img alt='no-icons-found' src={VirtualTour} className='Three-d-icons'/>
            <div>Virtual Tour</div>
          </div>
        </Link>
      </CRow>


      <CRow className='search-lens-parent'>
          <CFormInput placeholder='find content eg. topic, chapter etc..' value={inputText}  onChange={(e)=>inputSeachHandler(e)} />
        {!lensCrossToggler ? <FaSearch className='icons lens' style={{ fontSize: '1rem' }}  />:  <ImCross className='icons lens' style={{ fontSize: '1rem' }} onClick={clearSearchedTextHandler} />}  
      </CRow>
    </CContainer>
  )
}

export default Navigation
