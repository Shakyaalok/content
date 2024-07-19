import React,{useEffect} from 'react'
import { CCol, CContainer,CRow,CImage } from '@coreui/react';
import underConstruction from '../assets/images/under-construction.avif'
import { useNavigate } from 'react-router-dom';
import { isTokenExpire } from './gradeSubject';



const UnderMaintaince = () => {

  const navigate = useNavigate();
  const user_info = JSON.parse(localStorage.getItem('user_info'));


  useEffect(() => {
    if(!user_info || isTokenExpire(user_info?.accessToken)){
        localStorage.removeItem('user_info')
        navigate('/login');
    }
  }, [user_info,navigate])

  return (
    <CContainer>
        <CRow>
            <CCol>
            <CImage src={underConstruction} width='100%'/>

            </CCol>
        </CRow>
    </CContainer>
  )
}

export default UnderMaintaince
